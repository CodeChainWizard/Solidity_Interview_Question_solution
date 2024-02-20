// ——> Constructor

// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract X {
    string public name;

    constructor(string memory _name) {
        name = _name;
    }
}

contract Y{
    string public text;

    constructor(string memory _text) {
        text = _text;
    }
}
// Pass the parameters here in the inheritance List.
contract B is X("Input to X"), Y("Input to Y"){

}

contract C is X,Y {
    // Order is most importent
    constructor(string memory _name, string memory _text) X(_name) Y(_text) {
        
    }
}

// Parent constructors are always called in the order of inheritance.

contract D is X,Y {
    constructor() X("X was Called") Y("Y was called") {
        
    }
}

// Order of constructor called.
contract E is X,Y {
    constructor() Y("Y is Called") X("X is Called"){
        
    }
}
