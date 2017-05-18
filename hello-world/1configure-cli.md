The command line tool is accessed using the command *3scale-cli*. The CLI lets you create and configure services as well as application plans, methods, metrics, and mapping rules, so you can properly secure and configure access to your APIs.

The CLI is specially useful in situations where:

* You have lots of services and / or endpoints
* You have API definitions (Open API / Swagger or RAML formaT) for existing your service(s)

Before you can use the CLI tool you need to configure it.

## Task
In this section, our task is going to be to connect the CLI to our 3scale online account. In order to do so, run the following command:

`3scale-cli config`{{execute}}

When prompted, enter your 3scale access token and id:

* **3scale access token**: This is a personal access token to be able to use the Account Management API. You can create those clicking on *Personal settings > Tokens*. In this case, we have created one for you when preparing your environment, check it out in the terminal window.
* **3scale id**: This is the name in your admin portal login URL before the ‘-admin- part e.g. `https://3scaleid-admin.3scale.net/`. You have been randomly given one when starting the tutorial, you can find it going to the ‘Admin Portal’ tab or check it out in the terminal window.

Next, you can check if it was successful, for example, get all services in the indicated 3scale account:

`3scale-cli services list`{{execute}}

You should see at least one service and its id, name, etc.