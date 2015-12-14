var menu = require('node-menu');
var spawn = require('child_process').spawn;
    
var TestObject = function () {
    var self = this;
    self.fieldA = 'FieldA';
    self.fieldB = 'FieldB';
}

TestObject.prototype.printFieldA = function () {
    console.log(this.fieldA);
}

TestObject.prototype.printFieldB = function (arg) {
    console.log(this.fieldB + arg);
}

var testObject = new TestObject();

menu.addDelimiter('-', 80, 'Catalyst Help')
    .addItem(
        'Launch Visual Studio 2015',
        function () {
            var grep = spawn('devenv');
            grep.on('close', function (code, signal) {
                console.log('Visual Studio terminated with' + signal);
            });
        })
    .addItem(
        'Launch Explorer',
        function () {
            var grep = spawn('explorer',[process.cwd()]);
            grep.on('close', function (code, signal) {
                console.log('Explorer terminated with' + signal);
            });
        })
    .addDelimiter('*', 80)
    .addItem(
        'Launch Catalyst Solution',
        function () {
            var grep = spawn('devenv', ['..\\tmp\\VisualStudio\\Catalyst.sln']);
            grep.on('close', function (code, signal) {
                console.log('Visual Studio terminated with' + signal);
            });
        })
    .addDelimiter('*', 80)
    .disableDefaultHeader() 
    .start();