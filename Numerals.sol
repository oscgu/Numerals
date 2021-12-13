// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// [MIT License]
/// @title Numerals
/// @notice Provides a function for converting an uint to a roman numeral
/// @author Oscar Guertler <oscarguertler@gmail.com>
library Numerals {

    struct romanNumerals {
                    string numeral;
                    uint256 decimal;
                }

    /// @notice Converts an uint256 to its roman numeral representation (1-4000)
    function toRoman(uint256 number) internal pure returns (string memory) {
            romanNumerals[14] memory numerals = [romanNumerals("I", 1), romanNumerals("IV", 4), romanNumerals("V", 5), romanNumerals("IX", 9), romanNumerals("X", 10), romanNumerals("XL", 40), romanNumerals("L", 50), romanNumerals("XC", 90), romanNumerals("C", 100), romanNumerals("CD", 400), romanNumerals("D", 500), romanNumerals("CM", 900), romanNumerals("M", 1000), romanNumerals("MMMM", 4000)];
            uint256 max;
            string memory romanNumeral;

            while(number != 0) {
                max = highestNum(numerals, number);
                romanNumeral = string(abi.encodePacked(romanNumeral, numerals[max].numeral));
                number -= numerals[max].decimal;
            }
            return romanNumeral;
    }

    function highestNum(romanNumerals[14] memory numerals, uint256 number) private pure returns (uint256) {
        uint256 i;
        uint256 index;

        for(i=0; i<13; i++) {
            if(numerals[i].decimal <= number) {
                index = i;
            }
        }

        return index;
    }
}