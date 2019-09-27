pragma solidity ^0.5.11;

contract Notary {
    struct Document {
        uint256 timestamp;
        bytes32 hash;
        string owner;
    }
    
    mapping (bytes32 => Document) documentByHashMap;
    mapping (string => bytes32[]) documentHashesByOwnerMap;
    
    function registerDocument(bytes32 documentHash, string memory documentOwner) public returns(bool) {
        documentByHashMap[documentHash].timestamp = now;
        documentByHashMap[documentHash].hash = documentHash;
        documentByHashMap[documentHash].owner = documentOwner;

        documentHashesByOwnerMap[documentOwner].push(documentHash);

        return true;
    }
 
    function getDocumentByHash(bytes32 hash) public view returns(uint256, string memory) {
        return (documentByHashMap[hash].timestamp, documentByHashMap[hash].owner);
    }  
    
    function getDocumentHashesByOwner(string memory owner) public view returns(bytes32[] memory) {
        return documentHashesByOwnerMap[owner];
    }  
}
