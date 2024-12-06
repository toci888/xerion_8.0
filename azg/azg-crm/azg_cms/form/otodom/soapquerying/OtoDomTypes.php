<?
    class OfferWsdl 
    {
        public $InsertionId, $InsertionStatus, $InsertionModificationDate,
               $InsertionExpirationDate, $Country, $Province, $District, $CityId, $CityName,
               $QuarterId, $QuarterName, $Street, $Category, $Investment, $RemoteId,
               $Price, $PriceType, $PriceCurrency, $Area, $Keywords, $MarketType,
               $BuildingOwnership, $OfferType, $Description, $AllegroCategory,
               $Pictures, $Height, $AccessTypes, $Structure, $MediaTypes, $Heating,
               $UseTypes, $ParkingType, $Flooring, $Lighting, $Localization, $Type,
               $Dimensions, $Fence, $VicinityTypes, $ExtrasTypes, $FloorNo,
               $BuildingType, $BulidingFloorsNum, $RoomsNum, $TerrainArea,
               $ConstructionStatus, $BuildYear, $RoofType, $GarretType,
               $WindowsType, $HeatingTypes, $FenceTypes, $PersonsTypes, $Free,
               $Furnished;
    }
    class PictureWsdl 
    {
        public $Data;
    }
    class CurrencyWsdl
    {
        public $ID, $Code;
    }
    class CountryWsdl
    {
        public $ID, $Currency, $IsoCode, $PhonePrefix;
    }

?>