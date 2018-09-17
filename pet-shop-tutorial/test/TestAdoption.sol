pragma solidity ^0.4.17;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Adoption.sol";

contract TestAdoption {
    Adoption adoption = Adoption(DeployedAddresses.Adoption());

    //Testing the adopt() function
    function testUserCanAdoptPet() public {
        uint expected = 4;
        
        uint returnedId = adoption.adopt(expected);

        Assert.equal(returnedId, expected, "Adoption of pet ID 4 should be recorded.");
    }

    //Testing retrieval of a single pet's owner
    function testGetAdopterAddressByPetId() public {
        //Expected owner in this contract
        address expected = this;

        address adopter = adoption.adopters(4);

        Assert.equal(adopter, expected, "Owner of pet ID 4 should be recorded.");
    }

    //Testing retrieval of all pet owners
    function testGetAdopterAddressByPetIdInArray() public {
        //Expected owner in this contract
        address expected = this;

        //Store adopters in memory rather than contract's storage
        address[16] memory adopters = adoption.getAdopters();

        Assert.equal(adopters[4], expected, "Owner of pet ID 4 should be recorded.");        
    }
}