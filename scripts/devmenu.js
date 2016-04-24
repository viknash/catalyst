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
                console.log('Exit: ' + signal);
            });
        })
    .addItem(
        'Launch Explorer',
        function () {
            var grep = spawn('explorer',[process.cwd()+"\\.."]);
            grep.on('close', function (code, signal) {
                console.log('Exit: ' + signal);
            });
        })
    .addDelimiter('*', 80)
    .addItem(
        'Generate Catalyst Solution',
        function () {
            var grep = spawn('fbuild', ['solution'],{cwd:process.cwd()+'\\..\\src'});
			grep.stdout.on('data', function (data) {
			  console.log(''+data);
			});			
        })
    .addItem(
        'Launch Catalyst Solution',
        function () {
            var grep = spawn('devenv', ['..\\tmp\\VisualStudio\\Catalyst.sln']);
            grep.on('close', function (code, signal) {
                console.log('Exit: ' + signal);
            });			
        })
    .addItem(
        'Launch libCDS',
        function () {
            var grep = spawn('devenv', ['..\\extern\\libcds\\projects\\Win\\vc14\\cds.sln']);
            grep.on('close', function (code, signal) {
                console.log('Exit: ' + signal);
            });			
        })
    .addItem(
        'Generate Executor Solution',
        function () {
            var grep = spawn('fbuild', ['solution'],{cwd:process.cwd()+'\\..\\extern\\executors'});
			grep.stdout.on('data', function (data) {
			  console.log(''+data);
			});			
        })		
    .addItem(
        'Launch FASTBuild',
        function () {
            var grep = spawn('devenv', ['..\\extern\\fastbuild\\tmp\\VisualStudio\\FASTBuild.sln']);
            grep.on('close', function (code, signal) {
                console.log('Exit: ' + signal);
            });			
        })		
    .addItem(
        'Generate FASTBuild Solution',
        function () {
            var grep = spawn('fbuild', ['solution'],{cwd:process.cwd()+'\\..\\extern\\fastbuild\\Code'});
			grep.stdout.on('data', function (data) {
			  console.log(''+data);
			});			
        })		
    .addItem(
        'Launch executor',
        function () {
            var grep = spawn('devenv', ['..\\extern\\executors\\tmp\\VisualStudio\\Executor.sln']);
            grep.on('close', function (code, signal) {
                console.log('Exit: ' + signal);
            });			
        })		    .addItem(
        'Deploy Boost',
        function () {
            var grep = spawn('deploy.cmd', [],{cwd:process.cwd()+'\\..\\extern\\boost'});
			grep.stdout.on('data', function (data) {
			  console.log(''+data);
			});			
        })			
    .addDelimiter('*', 80)
    .disableDefaultHeader() 
    .start();