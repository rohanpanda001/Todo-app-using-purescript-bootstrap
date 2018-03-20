"use strict";

exports.logVal = function (a) {
    return function() {
        console.log(a);
    }
}

exports.getElement = function(a) {
    return document.getElementById(a);
}

exports.createField = function (a) {
    return function() {
        var x = document.createElement("INPUT");
        x.setAttribute("type", "text");
        x.setAttribute("id", "name");
        x.setAttribute("class", "form-control");
        x.placeholder = "Type name here..";
        x.setAttribute("value", "NAme name");
        document.getElementById(a).appendChild(x);

        var x = document.createElement("INPUT");
        x.setAttribute("type", "text");
        x.setAttribute("id", "description");
        x.setAttribute("class", "form-control");
        x.placeholder = "Enter Description..";
        x.setAttribute("value", "Hello World!");
        document.getElementById(a+"1").appendChild(x);

        var x = document.createElement("INPUT");
        x.setAttribute("type", "submit");
        x.setAttribute("id", "submit");
        x.setAttribute("class", "btn btn-primary");
        document.getElementById("form").appendChild(x);


    }
}

exports.addListener = function(btnId) {
    return function (callback) {
        function eventHandler() {
            callback();
        }
        document.getElementById(btnId).addEventListener("click",eventHandler);
        return function () {};
    }
}
