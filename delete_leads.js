const admin = require('firebase-admin');


admin.initializeApp({
  credential: admin.credential.cert("C:/Users/anna/Downloads/direct2lead-firebase-adminsdk-i8dz7-1c8ba4b7d2.json")
});

const db = admin.firestore();

async function deleteUserDocuments() {
  try {
    const leadsCollection = db.collection('leadInfo');
    const snapshot = await leadsCollection.get();

    // Iterate through all documents in the collection
    for (const doc of snapshot.docs) {
      const leadData = doc.data();
      // Check if leadCreationDate is missing or null
      if (!leadData.leadCreationDate) {
        // Delete document if it has no creation date
        await leadsCollection.doc(doc.id).delete();
        console.log(`Deleted lead document with UID: ${doc.id}`);
      }
    }

    console.log('Finished deleting lead documents.');
  } catch (error) {
    console.error('Error deleting lead documents:', error);
  }
}

// Run the delete function
deleteUserDocuments();

