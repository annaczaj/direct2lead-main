const functions = require('@google-cloud/functions-framework');
const admin = require('firebase-admin');

admin.initializeApp();

// Register an HTTP function with the Functions Framework
functions.http('sendLeadNotification', async (req, res) => {
    try {
        const cloudEvent = req.body;
        
        // Extract data from the Cloud Event
        const data = cloudEvent.data;
        if (!data) {
            throw new Error('No data received');
        }

        // Parse the Firestore document data
        const leadData = data.value.fields;
        const leadId = data.value.name.split('/').pop();
        
        // Get the recipient's FCM token
        const recipientDoc = await admin.firestore()
            .collection('users')
            .doc(leadData.leadRecipient.stringValue)
            .get();

        if (!recipientDoc.exists || !recipientDoc.data().token) {
            console.log('No recipient found or no FCM token available');
            res.status(200).send('No recipient found');
            return;
        }

        const recipientToken = recipientDoc.data().token;

        // Create notification message
        const message = {
            notification: {
                title: 'New Lead Received!',
                body: `New lead from ${leadData.name?.stringValue || 'Unknown'}`
            },
            data: {
                leadId: leadId,
                click_action: 'FLUTTER_NOTIFICATION_CLICK',
            },
            token: recipientToken
        };

        // Send the notification
        const response = await admin.messaging().send(message);
        console.log('Successfully sent notification:', response);
        
        res.status(200).send('Notification sent successfully');
    } catch (error) {
        console.error('Error sending notification:', error);
        res.status(500).send(error.message);
    }
}); 