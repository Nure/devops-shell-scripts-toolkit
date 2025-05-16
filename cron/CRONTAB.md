## To Run (i.e., Load it into Crontab)
### Use the `crontab` command:
    

	crontab cron/crontab.sample



### This ^ command:

-   **Installs** the contents of `crontab.sample` into the current user's crontab
    
-   All scheduled jobs will begin to execute at the specified times


### To Verify It's Installed
	crontab -l
You should see your entries listed.



### Want to Test Immediately?
Edit `crontab.sample` to include a quick-running job like:


	* * * * * echo "Hello from cron!" >> $HOME/cron_test.log

Then reload:

	crontab cron/crontab.sample

Wait 1 minute  and then:

	cat ~/cron_test.log
