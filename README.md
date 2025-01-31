# Git Hooks and Java Projects

### Why Use Git Hooks?

One reason, is to automate something you do every time you perform a certain action in Git. For instance running a build
when changes are received on a given branch. However, these kinds of tasks are usually solved by tools built for
purpose. For example Jenkins, Travis CI, Github actions, etc.

My favorite reason for using hooks is as validation. Early validation provides us with quick and regular feedback (
important for developing expertise in any field) and stops us from wasting time by straying down the wrong path.

Lets take a simple example, first without the hook. Your project has a standard commit messages format, and you've done
an early commit on your branch wrong. Then you merge in another branch, add multiple new commits, and push. The remote
repository rejects your changes. You now have to change that single commit message on your branch. You could do an
interactive rebase, squash merge onto a new branch, or cherry-pick your commits onto a new branch. Either way, you have
to do more work than normal.

What about with a validating hook in place to provide early feedback? Your project has a standard commit messages
format, and you've done an early commit on your branch wrong. The commit-msg hook stops the commit, immediately flags
your commit message as incorrect, and asks you to try again. Done. Early regular feedback stops you making work for
yourself, and you learn not to make that mistake much quicker.

### Managing Your Hooks

Let's say you're convinced and you want to add some hooks. How should we organise them? Makes sense to keep them in your
project's Git repo so you can track changes to them. But what if you need to use them across multiple repositories? And
how will you get the client side hooks installed for everyone working on the project?

Hooks should be managed the same way any good code should be. They should be a dependency of your project, pulled in and
installed/updated when you build your application. Let's go through an example Java setup using Maven as our build tool.
Full disclosure: I wrote one plugin and the client side Git hooks library used in the example that follows. So it might
be worth checking to see if there is anything better suited for your needs.

