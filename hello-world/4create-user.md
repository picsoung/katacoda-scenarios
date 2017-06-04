In this step we're going to give access to developers to our services.

Actually, in 3scale, access is given to applications, not to developers. Which means that the same developer could have:

- Multiple applications with access to different services AND / OR
- Different types of access to the same service

Let's see how it works.

## Task 1

Applications are created under developer accounts. So first of all, we're going to sign up a new developer.

For that, go to *Developers* and click on `+ Create`. Let's call him `Chris` (in the *username* field) and create him the following password `letmein`.

Now clic on `n Applications`.

![Application plans](../assets/applications.png)

You'll see how at least one application has been created. 3scale lets you configure different sign up flows so when a new developer registers they can get access to one or multiple servcies with one or multiple applications (and different types of plans). We're not going to cover setting up different sign up flows in this tutorial.

## Task 2

For the purpose of this tutorial, we're going to create a new application and give *Chris* internal access to your API.

Click on `+ Create Application`. In the *Application plan** dropdown, select the *internal* plan under the *Echo API* service.

![New application](../assets/new-app.png)

Save your changes.

Alright, I think Chris is ready to try out our API!







