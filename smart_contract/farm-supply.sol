// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FarmSupplyChain {
    // Struct to represent a farm product
    struct FarmProduct {
        uint256 productId;
        string productDescription;
        string producerName;
        string producerAddress;
        uint256 harvestDate;
        string distributerName;
        string distributerAddress;
        uint256 prodToDistDate;
        string retailerName;
        string retailerAddress;
        uint256 distToRetaDate;
    }

    // Mapping to store farm products
    mapping(uint256 => FarmProduct) public farmProducts;

    // Function to add a new farm product to the ledger
    function addNewFarmProduct(
        uint256 _id,
        string memory _description,
        string memory _producerName,
        string memory _producerAddress,
        uint256 _harvestDate
    ) public {
        require(farmProducts[_id].productId == 0, "Product with same ID already exists");
        
        farmProducts[_id] = FarmProduct(
            _id,
            _description,
            _producerName,
            _producerAddress,
            _harvestDate,
            "",
            "",
            0,
            "",
            "",
            0
        );
    }

    // Function to transfer the asset to the distributor from the producer
    function transferToDistributor(
        uint256 _id,
        string memory _distributerName,
        string memory _distributerAddress,
        uint256 _transferDate
    ) public {
        require(farmProducts[_id].productId != 0, "Product does not exist");
        
        farmProducts[_id].distributerName = _distributerName;
        farmProducts[_id].distributerAddress = _distributerAddress;
        farmProducts[_id].prodToDistDate = _transferDate;
    }

    // Function to transfer the asset to the retailer from the distributor
    function transferToRetailer(
        uint256 _id,
        string memory _retailerName,
        string memory _retailerAddress,
        uint256 _transferDate
    ) public {
        require(farmProducts[_id].productId != 0, "Product does not exist");
        
        farmProducts[_id].retailerName = _retailerName;
        farmProducts[_id].retailerAddress = _retailerAddress;
        farmProducts[_id].distToRetaDate = _transferDate;
    }

    // Function to view asset details from the ledger
    function queryFarmProductById(uint256 _id) public view returns (FarmProduct memory) {
        require(farmProducts[_id].productId != 0, "Product does not exist");
        
        return farmProducts[_id];
    }
}
