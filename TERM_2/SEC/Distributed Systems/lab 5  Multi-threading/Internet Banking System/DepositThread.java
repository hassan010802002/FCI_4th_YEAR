/* DepositThread.java A thread that deposit a given amount to a given
account. */
public class DepositThread implements Runnable {
    private Account account;
    private double amount;

    public DepositThread(Account account, double amount) {
        this.account = account;
        this.amount = amount;
    }

    public void run() {
        // make a deposit
        account.deposit(amount);
    }
}// end DepositThread class
