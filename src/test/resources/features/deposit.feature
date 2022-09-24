Feature: transfer
  As a customer
  I want to deposit money into my account

  Scenario Outline: Deposit with no exsiting balance as table
    Given a customer with id 1 and pin 0000 exists
    When I login to ATM with id 1 and pin 0000
    When ฝากเงิน <amount> ในบัญชี
    Then my account balance is <value>

    Examples:
      | amount | value |
      | 0 | 0 |
      | 1000.00 | 1000.00 |
      | 1200.00 | 1200.00 |

  Scenario Outline: Deposit with existing balance as table
    Given a customer with id 1 and pin 0000 with balance 1000.00 exists
    When I login to ATM with id 1 and pin 0000
    When ฝากเงิน <amount> ในบัญชี
    Then my account balance is <value>

    Examples:
      | amount | value |
      | 0 | 1000.00 |
      | 1000.00 | 2000.00 |
      | 1200.00 | 2200.00 |