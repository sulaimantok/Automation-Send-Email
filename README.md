# Automation-Send-Email

keyword: Automation, CI/CD

#### This project guides you to automate send report to many people, with one execution via email

1. First, you must clone this repository on your computer
2. The second if you want to run through github action, you can fork this repository, If you will plan running this script in local machine, Make sure your computer has a docker installed ![docker install](https://docs.docker.com/install/)
3. Edit the file "action.yml" if we are going to run using github action, if we are running on a local machine, just edit the file "sendmail.sh"

The following are some of the variables that can be set to run this script

| Key              | Value                                                                                                                                                 | Example                       |
|------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------|
| SMPT        | the address of the mail server and also the port, this sample using gmail                                                                                                                               | smtp.gmail.com":587 |
| USER    | user used to send email                                                    | user@gmail.com    |
| PASSWORD         | user password used | Password        |

By default some of the variables above are configured.