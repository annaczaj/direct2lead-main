const functions = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp();

admin.initializeApp({
    credential: admin.credential.cert(require("C:/Users/anna/Downloads/direct2lead-firebase-adminsdk-i8dz7-3916fe64dd.json")) // Use forward slashes
  });

  exports.sendNotificationToRecipient = functions.firestore
  .document("leadInfo/")
  .onCreate(async (snap, context) => {
    const leadData = snap.data();
    const recipientId = leadData.recipientId; // Assume lead contains recipientId
    
    // Fetch the FCM token of the recipient
    const recipientDoc = await admin.firestore().collection("recipients").doc(recipientId).get();

    if (!recipientDoc.exists) {
      console.error("No such recipient!");
      return;
    }

    const recipientToken = recipientDoc.data().fcm_token;
    
    // Create notification payload
    const payload = {
      notification: {
        title: "New Lead Submitted!",
        body: `You have received a new lead from ${leadData.leadName}`,
        click_action: "FLUTTER_NOTIFICATION_CLICK",
      },
    };

    // Send the notification to the recipient
    if (recipientToken) {
      return admin.messaging().sendToDevice(recipientToken, payload)
        .then(response => {
          console.log("Successfully sent message:", response);
          return null;
        })
        .catch(error => {
          console.error("Error sending message:", error);
        });
    }
  });