import { getFirestore } from 'firebase-admin/firestore';
import { getMessaging } from 'firebase-admin/messaging';
import { initializeApp } from 'firebase-admin/app';
import * as functions from '@google-cloud/functions-framework';

// Initialize Firebase Admin without explicit credentials
// It will use the service account credentials automatically
initializeApp();

functions.cloudEvent('sendCommentNotification', async (cloudEvent) => {
    try {
        console.log('Function triggered');
        console.log('Raw subject:', cloudEvent.subject);

        const db = getFirestore();
        
        // Get just the comment ID from the path
        const commentId = cloudEvent.subject.split('/').pop();
        console.log('Comment ID:', commentId);

        // First get the comment document
        const commentRef = db.collection('comments').doc(commentId);
        const commentDoc = await commentRef.get();
        
        if (!commentDoc.exists) {
            throw new Error('Comment document not found');
        }

        const commentData = commentDoc.data();
        const {
            content,
            commentOwner: commentOwnerRef,
            commentLeadChoice: leadRef,
            createdAt
        } = commentData;

        // Get the actual documents from the references
        const commentOwnerDoc = await db.doc(commentOwnerRef.path).get();
        const leadDoc = await db.doc(leadRef.path).get();

        console.log('Resolved data:', {
            content,
            commentOwner: commentOwnerDoc.data(),
            lead: leadDoc.data(),
            createdAt
        });

        const {
            leadRecipient,
            leadSender
        } = leadDoc.data();

        const currentUserId = commentOwnerDoc.data().path.split('/').pop();
        
        // Determine recipient (the user who didn't make the comment)
        let recipientId;
        if (leadRecipient === currentUserId) {
            recipientId = leadSender;
        } else {
            recipientId = leadRecipient;
        }

        // Get recipient user document
        const recipientDoc = await db
            .collection('users')
            .doc(recipientId)
            .get();

        if (!recipientDoc.exists) {
            throw new Error('Recipient user document not found');
        }

        const recipientData = recipientDoc.data();
        console.log('Recipient token:', recipientData.token?.substring(0, 10) + '...');

        // Get commenter's name
        const commenterDoc = await db
            .collection('users')
            .doc(currentUserId)
            .get();

        const commenterName = commenterDoc.exists ? commenterDoc.data().display_name : 'Unknown User';

        // Create iOS specific message
        const message = {
            notification: {
                title: 'New Comment on Lead',
                body: `${commenterName}: ${commentData.content || ''}`
            },
            data: {
                leadId: leadDoc.id,
                commentId: commentDoc.id,
                commentUser: currentUserId,
                leadRecipient: leadDoc.data().leadRecipient,
                leadSender: leadDoc.data().leadSender,
                click_action: 'FLUTTER_NOTIFICATION_CLICK',
            },
            token: recipientData.token,
            apns: {
                payload: {
                    aps: {
                        sound: 'default',
                        badge: 1,
                        contentAvailable: true
                    }
                }
            }
        };

        console.log('Sending iOS notification:', JSON.stringify(message, null, 2));
        const response = await getMessaging().send(message);
        console.log('FCM response:', response);

        // Update comment document
        await commentDoc.ref.update({
            notificationSent: true,
            notificationTime: new Date()
        });

        return { success: true };

    } catch (error) {
        console.error('Function error:', {
            code: error.code,
            message: error.message,
            errorInfo: error.errorInfo
        });
        throw error;
    }
});