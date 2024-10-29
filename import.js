const admin = require('firebase-admin');
const csv = require('csv-parser');
const fs = require('fs');
const { v4: uuidv4 } = require('uuid');

// Initialize Firebase Admin SDK
admin.initializeApp({
  credential: admin.credential.cert(require("C:/Users/123ad.MONKEY/Downloads/direct2lead-firebase-adminsdk-i8dz7-945b4ba7b1.json")) // Use forward slashes
});

// Get Firestore instance
const db = admin.firestore();

// Function to import users from CSV
async function importUsers() {
  const users = [];

  // Read CSV file
  fs.createReadStream("C:/Users/123ad.MONKEY/OneDrive/Desktop/cleaned_import.csv")
    .on('error', (err) => {
      console.error('Error while opening CSV file:', err.message);
    })
    .pipe(csv())
    .on('data', (row) => {
      // Clean up row keys to remove extra spaces
      const cleanedRow = {};
      Object.keys(row).forEach((key) => {
        cleanedRow[key.trim()] = row[key];
      });

      console.log('Processing row:', cleanedRow); // Log each row to verify the data
      const uid = uuidv4(); // Generate a unique ID for each user

      // Add each row to users list, with uid added
      users.push({
        uid,
        email: cleanedRow['email']?.trim() || '',
        emailVerified: true, // Mark email as verified
        password: 'defaultPassword123', // Set a default password for each user
        display_name: cleanedRow['display_name']?.trim() || 'No Name Provided',
        photo_url: cleanedRow['photo_url']?.trim() || '',
        groupid: cleanedRow['groupid']?.trim() || '',
        adminaccount: cleanedRow['adminaccount']?.toString().toLowerCase() === 'true',
        usertype: cleanedRow['usertype']?.trim() || '',
        superadmin: cleanedRow['superadmin']?.toString().toLowerCase() === 'true'
      });
    })
    .on('end', async () => {
      console.log('CSV file successfully processed.');
      console.log('Users:', users); // Log the users array to see if it's populated correctly

      if (users.length === 0) {
        console.error('No users found in CSV.');
        return;
      }

      console.log('Importing users...');
      try {
        const userChunks = chunkArray(users, 1000); // Import users in batches of up to 1000
        for (const chunk of userChunks) {
          console.log(`Importing chunk of ${chunk.length} users...`);
          for (const user of chunk) {
            const { uid, email, emailVerified, password, display_name } = user;
            try {
              await admin.auth().createUser({
                uid,
                email,
                emailVerified,
                password,
                display_name
              });
              console.log(`User created in Auth for UID: ${uid}`);
            } catch (error) {
              console.error(`Error creating user in Auth for UID: ${uid}`, error.message);
            }
          }

          // Adding additional user data to Firestore
          for (const user of chunk) {
            const { uid, email, display_name, photo_url, groupid, adminaccount, usertype, superadmin } = user;
            const userData = {
              email,
              display_name,
              groupid,
              adminaccount,
              usertype,
              superadmin,
              created_time: admin.firestore.FieldValue.serverTimestamp()
            };

            // Only add photoURL if it's defined and not empty
            if (photo_url) {
              userData.photo_url = photo_url;
            }

            try {
              await db.collection('users').doc(uid).set(userData);
              console.log(`User data added to Firestore for UID: ${uid}`);
            } catch (error) {
              console.error(`Error adding user data to Firestore for UID: ${uid}`, error.message);
            }
          }
        }
        console.log('Users imported successfully!');
      } catch (error) {
        console.error('Error importing users:', error);
      }
    });
}

// Helper function to split users into chunks of a specific size
function chunkArray(array, size) {
  const chunkedArr = [];
  for (let i = 0; i < array.length; i += size) {
    chunkedArr.push(array.slice(i, i + size));
  }
  return chunkedArr;
}

// Call the import function
importUsers();