But before Chris tries our API, let's test the integration and verify that everything is working properly.

## Task 1

Switch to your Admin Portal tab and go to *APIs > Integration* to test your integration. Review the following information one more time:

- **Private base URL**: `https://echo-api.3scale.net:443`
- **Mapping rules**: you should see the ones you imported
- **Client**: the example cURL command should be using the staging public base URL and have a `user_key` which corresponds to the application we just created.

If everything looks good, click on the `Update & test in Staging Environment` button to make a test call.

Did the line turn green? That means your integration is properly working!