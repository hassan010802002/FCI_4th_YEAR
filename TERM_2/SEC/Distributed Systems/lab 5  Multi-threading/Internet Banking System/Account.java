/* Account.java: A program with synchronized methods for the Account class.
*/
public class Account {
    private double balance = 0;

    public Account(double balance) {
        this.balance = balance;
    }

    // if ‘synchronized’ is removed, the outcome is unpredictable
    public void deposit(double amount) {
        if (amount < 0) {
            throw new IllegalArgumentException("Can’t deposit.");
        }
        this.balance += amount;
        System.out.println(
                "Deposit " + amount + " in thread " + Thread.currentThread().getId() + ", balance is " + balance);
    }

    // if ‘synchronized’ is removed, the outcome is unpredictable
    public void withdraw(double amount) {
        if (amount < 0 || amount > this.balance) {
            throw new IllegalArgumentException("Can’t withdraw.");
        }
        this.balance -= amount;
        System.out.println(
                "Withdraw " + amount + " in thread " + Thread.currentThread().getId() + ", balance is " + balance);
    }
}// end Account class
