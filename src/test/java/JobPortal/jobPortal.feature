Feature: all job portal scenarios

  @getAll
  Scenario: to test the get all jobs request
    Given url 'http://localhost:9897/'
    When  path '/normal/webapi/all'
    And method get
    Then status 200


    @create1
  Scenario: to test the get all jobs request
    Given url 'http://localhost:9897/'
    When  path '/normal/webapi/add'
    And request
    """
{
  "experience": [
    "3+ years of experience in full-stack web development using JavaScript, React, and Node.js.",
    "Proficient in designing RESTful APIs and working with SQL and NoSQL databases like PostgreSQL and MongoDB.",
    "Hands-on experience with CI/CD pipelines using GitHub Actions and Jenkins.",
    "Worked in agile teams with JIRA and participated in daily scrums, sprint planning, and code reviews."
  ],
  "jobDescription": "We are looking for a talented Full-Stack Developer to join our engineering team. You will be responsible for developing and maintaining web applications, collaborating with cross-functional teams, and ensuring high performance and responsiveness of applications.",
  "jobId": 1023,
  "jobTitle": "Full-Stack Developer",
  "project": [
    {
      "projectName": "E-Commerce Platform",
      "technology": [
        "React",
        "Node.js",
        "Express.js",
        "MongoDB",
        "Docker",
        "AWS"
      ]
    },
    {
      "projectName": "Real-Time Chat Application",
      "technology": [
        "Next.js",
        "Firebase",
        "Tailwind CSS",
        "Socket.IO"
      ]
    }
  ]
}

    """
    And method post
    Then status 200


  @create2
  Scenario: to test the get all jobs request
    Given url 'http://localhost:9897/'
    When  path '/normal/webapi/add'
    And request read('createUser.json')
    And method post
    Then status 200

    @DemoDataProvider
    Scenario Outline: print the data
      Given print '<name>'
      * print '<email>'
      * print '<contact>'
      * print '<city>'
      Examples:
        | name         | email                  | contact      | city         |
        | Alice Smith  | alice@example.com      | 1234567890   | New York     |
        | Bob Johnson  | bob.j@gmail.com        | 9876543210   | Los Angeles  |
        | Clara Evans  | clara.evans@mail.com   | 5556677889   | Chicago      |
        | David Brown  | david.b@domain.org     | 4441234567   | Houston      |