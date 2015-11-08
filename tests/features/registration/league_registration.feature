Feature: Allow registered users to sign up for a leauge

  Scenario: Anonymous users may not register
    Given I am an anonymous user
    When I go to the homepage
    Then I should not see "My Account"

  Scenario: Anonymous users may not create a registration node
    Given I am an anonymous user
    When I go to "node/add/registration"
    Then I should not see "Registration"
    And I should get a 403 HTTP response

    @api
  Scenario: Administrative users may create a registration node
    Given I am logged in as a user with the "administrator" role
    When I go to "node/add/registration"
    Then I should see "Registration"
    And I should get a 200 HTTP response

    @api
  Scenario: Authenticated users may create a registration node
    Given I am logged in as a user with the "authenticated user" role
    When I go to "node/add/registration"
    Then I should see "Registration"
    And I should get a 200 HTTP response

    @api
  Scenario: Player users may create a registration node
    Given I am logged in as a user with the "player" role
    When I go to "node/add/registration"
    Then I should see "Registration"
    And I should get a 200 HTTP response

    @api
  Scenario: Captain users may create a registration node
    Given I am logged in as a user with the "team_captain" role
    When I go to "node/add/registration"
    Then I should see "Registration"
    And I should get a 200 HTTP response


  @api
  Scenario: Users should not see the node title
    Given I am logged in as a user with the "authenticated user" role
    When I go to "node/add/registration"
    Then I should not see "Player name"
    And I should not see "Revision information"
    When I press "Save"
    Then I should see "has been created"

    @api
  Scenario: Users may only view their own registrations, not anyone else's
    Given I am logged in as a user with the "authenticated user" role
    When I go to "node/add/registration"
    And I press "Save"
    Then I should see "Submitted by"
    And I should get a 200 HTTP response

  Scenario: Users may only create one registration node per league

  Scenario: Users may pay for an individual registration

  Scenario: Users may pay for a team registration
