const admin = require('firebase-admin');
const csv = require('csv-parser');
const fs = require('fs');
const { v4: uuidv4 } = require('uuid');

// Initialize Firebase Admin SDK
admin.initializeApp({
  credential: admin.credential.cert(require("C:/Users/anna/Downloads/direct2lead-firebase-adminsdk-i8dz7-3916fe64dd.json")) // Use forward slashes
});

// Get Firestore instance
const db = admin.firestore();

// Function to import users from CSV
async function importLeads() {
  const leads = [];

  // Read CSV file
  fs.createReadStream("C:/Users/anna/Downloads/filesaver-Realtor to LO List_Oct 28 24 4_52 pm.csv")
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
      const did = uuidv4();

      // Add each lead to leads list, with sender info added
      leads.push({
        did,
        areaOfInterest: cleanedRow['areaOfInterest']?.toString().split(',') || [],
        highNurture: cleanedRow['highNurture']?.trim() || '',
        leadName: cleanedRow['leadName']?.trim() || '',
        leadEmail: cleanedRow['leadEmail']?.trim() || '',
        leadCreationDate: new Date(Date.parse(cleanedRow['leadCreationDate']?.toString())) || Date.now,
        leadRecipient: cleanedRow['leadRecipient']?.trim() || '',
        leadSender: cleanedRow['leadSender']?.trim() || '',
        senderInfo: '/users/' + cleanedRow['leadSender']?.trim() || '',
        leadPhone: cleanedRow['leadPhone']?.trim() || '',
        language: cleanedRow['language']?.trim() || 'English',
        leadStage: cleanedRow['leadStage']?.trim() || '',
        prequalOrPending: cleanedRow['prequalOrPending']?.trim() || '',
        numComments: parseInt(cleanedRow['numComments']?.toString()) || 0,
        notes: cleanedRow['notes']?.trim() || '',
        loanPurpose: cleanedRow['loanPurpose']?.trim() || '',
        homeToSellLender: cleanedRow['homeToSellLender']?.trim() || '',
        homeToSellRealtor: cleanedRow['homeToSellRealtor']?.trim() || '',
        prequalAmtLender: cleanedRow['prequalAmtLender']?.trim() || '',
        prequalAmtRealtor: cleanedRow['prequalAmtRealtor']?.trim() || '',
        workingWithRealtor: cleanedRow['workingWithRealtor']?.trim() || '',
        workingWithLender: cleanedRow['workingWithLender']?.trim() || '',
        readyToApply: cleanedRow['readyToApply']?.trim() || '',
        senderUserType: cleanedRow['senderUserType']?.trim() || '',
        senderGroupID: cleanedRow['senderGroupID']?.trim() || ''
      });
    })
    .on('end', async () => {
      console.log('CSV file successfully processed.');
      console.log('Leads:', leads); // Log the leads array to see if it's populated correctly

      if (leads.length === 0) {
        console.error('No leads found in CSV.');
        return;
      }

      console.log('Importing leads...');
      try {
        const leadChunks = chunkArray(leads, 1000); // Import users in batches of up to 1000
        for (const chunk of leadChunks) {
          console.log(`Importing chunk of ${chunk.length} leads...`);
        
          for (const lead of chunk) {
            const { did, leadName, leadEmail, leadCreationDate, leadRecipient, leadSender, leadPhone, language, leadStage, prequalOrPending, senderInfo, numComments, notes, loanPurpose, homeToSellLender, homeToSellRealtor, prequalAmtLender, prequalAmtRealtor, highNurture, workingWithRealtor, workingWithLender, readyToApply, senderUserType, senderGroupID } = lead;
            const leadData = {
              leadName,
              leadEmail,
              leadCreationDate,
              leadRecipient,
              leadSender,
              leadPhone,
              language,
              leadStage,
              prequalOrPending,
              senderInfo,
              numComments,
              notes,
              loanPurpose,
              homeToSellLender,
              homeToSellRealtor,
              prequalAmtLender,
              prequalAmtRealtor,
              highNurture,
              workingWithRealtor,
              workingWithLender,
              readyToApply,
              senderUserType,
              senderGroupID
            };

            try {
              await db.collection('leadInfo').doc(did).set(leadData);
              console.log(`Lead data added to Firestore for document: ${did}`);
            } catch (error) {
              console.error(`Error adding lead data to Firestore for document: ${did}`, error.message);
            }
          }
        }
        console.log('Leads imported successfully!');
      } catch (error) {
        console.error('Error importing leads:', error);
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
importLeads();