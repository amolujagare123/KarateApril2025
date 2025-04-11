function() {
  var Base64 = Java.type('java.util.Base64');

   var username = 'admin'
   var password = 'demo'
  var credentials = username + ':' + password

  karate.defineStep('encode credentials = {string}', function(credentials) {
    var encoded = Base64.getEncoder().encodeToString(credentials.getBytes());
    karate.set('encodedCredentials', encoded);
  });
}