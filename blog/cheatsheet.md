
Anatomy of a Javascript Object

VALID Object forms

var obj = { property1 : value1,  // “property  :    value"
            property2:  function1(arg1, arg2, etc.) { // “property   :   method(arguments)"
              // When function is within object, called “method"
              method..; //  Method goes between these brackets
              }
            property3:  { nested_obj1: nested_value1
              // nested property:value pair—value of property3 is another object
              }
            property4: [1,2,”three”,”four”], //value can be an array
               etc.
          }

INVALID Object forms

var obj_invalid = {property_invalid1 : value_invalid1},       //Only one outer bracket allowed
                  {property_invalid2 : value_invalid2},
                    etc.

var obj_invalid2 = { [1,2,3,4] : “value_invalid1”, // Property name must be String or Number
                     //Property can’t be variable assignment or function
                     var invalid = function(){return "invalid")}: “invalid example”
                    }

Ways of Creating Javascript Objects

1) Object Literals (a.k.a. “Object Initializer” Format)

   var obj = { property1 : value1}
//Literal because you are “literally” writing the object the way Javascript will represent it when it is created.

2) Object Constructor

var example1 = new Object();               //Calling the Object() function to create the new object
example1.property1 = "value1";              // Assignment of new values and properties

3) Object Constructor Function

//Used to automate creation of many objects from same object pattern

function Example2 (argument1, argument2, etc.) {       //convention is to capitalize function name
    this.argument1 = argument1              //“this” statement refers to *this* function
    this.argument2 = argument2
    this.argument3 = function(){
        console.log(“This is argument1: “ + this.argument1) //“this” also used to refer to property of object
  }
}

var instance1 = new Example2(“argument1”,”argument2”, etc.)

//“instance1" is new instance of constructor function

4) Object Prototypes

//Prototypes create default hidden properties of an object.

function Example(){
  //Start with empty function
}

Example.prototype.property1 = function(){
    console.log(“value1)”;     //Assign a prototype property to console.log(“value1”)
}

var object1 = new Example(); //Create new variable that is example of Function
object1.property1();  //Call property1 function
// => “value1" - Value from prototype returned
console.log(object1)
// => {} - But no properties listed for object because property comes from prototype
object1.property2 = “value2”     //Assign a new value to object1
console.log(object1)
// => {property2 : ‘value2’} - property2 is not a prototype, but connected to particular object, so it displays

Dot vs. Bracket Notation for Accessing Object Values

1) Dot Notation

var object1 = new Object();                //create new object using object constructor
object1.property1 = “example1”;            //assign property1 using dot notation.

  Invalid Dot Notation

object1.3 = "invalid1";                   //dot notation can’t do number
variable1 = "invalid2";
object1.variable1;                        //dot notation can’t do a variable

2) Bracket Notation

var object2 = new Object();
variable2 = "valid";
object2[variable2]                         //can accept a variable
//“valid"
object2[3]                                 //can accept a number

                                           //dot notation must already be string, bracket converts input to string before getting value

/***********************************************************************************************/
Useful Built in Methods, Keywords and Operators

I. this. Keyword

1) this. As an Object Method

  // When a function is called as a method of an object, 'this.' is set to the object the method is called on.

  // "this." can be defined inline:
  var object1 = {
      property1: value1,
      property2: function(argument1, ...){
        return this.property1;
      }
  }     // returns value1

  // "this." can be included in a function called on the object
  var object1 = {property1: value1}
  function functionName(argument1, ...) {
    return this.property1;
  }
  object1.function = functionName; //returns value1

2) this. On the Objects Prototype Chain

  // If the method is on an object's prototype chain, .this refers to the object the method was called on, as if the method was on the object.

  var object1 = {
    property1: function(argument1, ...) {
      return this.a this.b;
      }
    }
  var prototype1 = Object.prototype(object1);
  prototype1.a = num1;
  prototype1.b = num2;

  console.log(prototype1.property1()) // returns sum of num1 & num2

3) this. As an Object Constructor Function (See example above)

  // In conjection with the 'new' Keyword, this. is bound to the new object being constructed.

II. delete Operator

// the delete operator removes a property from an object.

1) deleting object elements

  var object1 = {
  property1: "value1",
  property2: "value2"
}

delete object1.property1; // removes property1/value1 pair from object1
console.log(object1);     // shows only property2/value2 pair in object1

2) deleting array elements

var array1 = ["value1","value2","value3"];

delete array1[1];
console.log(array1); // returns ["value1",,"value3"]



III. .keys Method

// of an array or the property (key value) of an object

1) .keys Method on an array will return an array whose elements are strings of the indices of the original array.

var array1 = [ 2, 4, 6, 8 ]
console.log(Object.keys(array1)) // returns ['0', '1', '2', '3']

2) .key Method on an Object will return an array of whose elements are strings of the property values.
    if the property values are numbers, they will return the value in numerical order.

var object1  = {8: 'a', 6: 'b', 2: 'c', 4: 'd'};
console.log(Object.keys(object1));

III. .hasOwnProperty Method

// This method returns a boolean indicating ifan object has a specified property (passed as the argument) as a direct property of that object. Does not check if the properity is in the object's prototype chain.

1) .hasOwnProperty to test a properties existance.

  object1 = new Object();
  object1.property1 = "exists?";

  function changeFunction() {
    object1.property2 = object1.property1;
    delete object1.property1;
  }

  console.log(object1.hasOwnProperty('property1')); // Return true because value associated with 'property1' exists in object1
  changeFunction(); // this function assigns the value of property1 to property2 and deletes property1
  console.log(object1.hasOwnProperty('property1')) // Returns false because property1 no longers exists in object1, even though the value has been moved to property2

III. .getOwnPropertyNames Method

// returns an array of all properties found directly upon a given object.

  var object1 = {
  property1: "value1",
  property2: "value2",
  property3: "value3"
}

console.log(Object.getOwnPropertyNames(object1)); // returns [ 'property1', 'property2', 'property3' ]


