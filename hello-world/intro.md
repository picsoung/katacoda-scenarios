In this self paced tutorial you will learn how to integrate your API services with 3scale API Management Platform, from importing an API definition to publishing your service and letting people try it out.

## Let’s get started
If you are not familiar with the 3scale API Management Platform, it's worth taking a few minutes to understand the basics of the platform as well as the environment that you will be using for this self paced tutorial.

3scale has two main components: the API Manager and APIcast, the API traffic manager. The API Manager centralizes API program tools including access control, rate limiting, analytics, billing and payments, and developer workflow, so you can manage all aspects of your program from a single interface.

The unique separation of the cloud management layer and API traffic control provides maximum flexibility. Delivery components that carry your API traffic can be anywhere, and traffic does not need to flow through the 3scale layer.

You choose integration and deployment methods to control access to endpoints and track traffic. Deploy on-premise or in the cloud with no black box required. Multi-departmental utility, flexible security options, and DevOps readiness are foundations of our infrastructure. 

Both Developers and Operators communicate with the 3scale AMP via one of the following methods:

### Command Line Interface
The command line tool that we will be using as part of this training is called 3scale-cli tool. This tool is written in Javascript and you’ll need npm to install it.

### Admin Portal
3scale provides a friendly graphical interface for interacting with the platform, the Admin Portal. The Admin Portal is the central place for API providers to manage and secure the access to their APIs.

### 3scale APIs
The command line tool communicates with 3scale via the Account Management API. 3scale also has other API services to get access to services, analytics, and billing information. You can check out the interactive documentation at: [https://support.3scale.net/docs/3scale-apis-activedocs](https://support.3scale.net/docs/3scale-apis-activedocs)

During this training, you will be using both the command line interface and the Admin Portal.

## The environment
During this training course you will be using a hosted 3scale environment that is created on the fly just for you (and deleted when you finish the tutorial). 

The 3scale environment that has been created for you is running the latest version of 3scale. This deployment is a self contained environment that provides everything you need to be successful in learning the platform. 

And without further ado, let's get started!
