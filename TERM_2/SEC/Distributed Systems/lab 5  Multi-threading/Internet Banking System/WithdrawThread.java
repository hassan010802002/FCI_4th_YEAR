/* WithdrawThread.java A thread that withdraw a given amount from a given
account. */
public class WithdrawThread implements Runnable {
    private Account account;
    private double amount;

    public WithdrawThread(Account account, double amount) {
        this.account = account;
        this.amount = amount;
    }

    public void run() {
        // make a withdraw
        account.withdraw(amount);
    }
}// end WithdrawThread class
