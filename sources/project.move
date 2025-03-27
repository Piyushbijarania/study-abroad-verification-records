module MyModule::StudyAbroadVerification {
    
    use aptos_framework::signer;

    /// Struct to store verification details.
    struct VerificationRecord has store, key {
        verified: bool,
        institution: vector<u8>,
    }

    /// Function to create a new verification record.
    public fun create_verification(owner: &signer, institution: vector<u8>) {
        let record = VerificationRecord {
            verified: false,
            institution,
        };
        move_to(owner, record);
    }

    /// Function to verify a student's study abroad record.
    public fun verify_record(admin: &signer, student: address) acquires VerificationRecord {
        let record = borrow_global_mut<VerificationRecord>(student);
        record.verified = true;
    }
}
