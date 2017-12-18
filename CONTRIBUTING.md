# Contributing

The following is a set of guidelines for contributing to any program published in this repository. These are mostly guidelines, not rules. 

#### Table Of Contents

[Code of Conduct](#code-of-conduct)

[How Can I Contribute?](#how-can-i-contribute)
  * [Reporting Bugs](#reporting-bugs)
  * [Suggesting Enhancements](#suggesting-enhancements)

[Styleguides](#styleguides)
  * [Git Commit Messages](#git-commit-messages)

[Additional Notes](#additional-notes)
  * [Issue and Pull Request Labels](#issue-and-pull-request-labels)

## How Can I Contribute?

### Reporting Bugs

This section guides you through submitting a bug report. Following these guidelines helps maintainers and the community understand your report :pencil:, reproduce the behavior, and find related reports :mag_right:.

Before creating bug reports, please check [this list](#before-submitting-a-bug-report) as you might find out that you don't need to create one. When you are creating a bug report, please [include as many details as possible](#how-do-i-submit-a-good-bug-report). Fill out [the required template](ISSUE_TEMPLATE.md), the information it asks for helps us resolve issues faster.

> **Note:** If you find a **Closed** issue that seems like it is the same thing that you're experiencing, open a new issue and include a link to the original issue in the body of your new one.

#### Before Submitting A Bug Report

* **Perform a [cursory search](https://github.com/search?q=+is%3Aissue+user%3Ahagi17)** to see if the problem has already been reported. If it has **and the issue is still open**, add a comment to the existing issue instead of opening a new one.

#### How Do I Submit A (Good) Bug Report?

Bugs are tracked as [GitHub issues](https://guides.github.com/features/issues/). Create an issue on that repository and provide the following information by filling in [the template](ISSUE_TEMPLATE.md).

Explain the problem and include additional details to help maintainers reproduce the problem:

* **Use a clear and descriptive title** for the issue to identify the problem.
* **Describe the exact steps which reproduce the problem** in as many details as possible. For example, start by explaining how you started the program, e.g. which command exactly you used in the terminal, or how you started the Program otherwise. When listing steps, **don't just say what you did, but explain how you did it**.
* **Provide specific examples to demonstrate the steps**. Include links to files or GitHub projects, or copy/pasteable snippets, which you use in those examples. If you're providing snippets in the issue, use [Markdown code blocks](https://help.github.com/articles/markdown-basics/#multiple-lines).
* **Describe the behavior you observed after following the steps** and point out what exactly is the problem with that behavior.
* **Explain which behavior you expected to see instead and why.**
* **Include screenshots and animated GIFs** which show you following the described steps and clearly demonstrate the problem. If you use the keyboard while following the steps,
* **If you're reporting that a Program crashed**, include a crash report with a stack trace from the operating system. On macOS, the crash report will be available in `Console.app` under "Diagnostic and usage information" > "User diagnostic reports". Include the crash report in the issue in a [code block](https://help.github.com/articles/markdown-basics/#multiple-lines), a [file attachment](https://help.github.com/articles/file-attachments-on-issues-and-pull-requests/), or put it in a [gist](https://gist.github.com/) and provide link to that gist.
* **If the problem wasn't triggered by a specific action**, describe what you were doing before the problem happened and share more information using the guidelines below.

Provide more context by answering these questions:

* **Did the problem start happening recently** or was this always a problem?
* **Can you reliably reproduce the issue?** If not, provide details about how often the problem happens and under which conditions it normally happens.

Include details about your configuration and environment:

* **Which version are you using?**
* **What's the name and version of the OS you're using**?
* **Which keyboard layout are you using?** Are you using a US layout or some other layout?

### Suggesting Enhancements

This section guides you through submitting an enhancement suggestion, including completely new features and minor improvements to existing functionality. Following these guidelines helps maintainers and the community understand your suggestion :pencil: and find related suggestions :mag_right:.

Before creating enhancement suggestions, please check [this list](#before-submitting-an-enhancement-suggestion) as you might find out that you don't need to create one. When you are creating an enhancement suggestion, please [include as many details as possible](#how-do-i-submit-a-good-enhancement-suggestion). Fill in [the template](ISSUE_TEMPLATE.md), including the steps that you imagine you would take if the feature you're requesting existed.

#### Before Submitting An Enhancement Suggestion

* **Perform a [cursory search](https://github.com/search?q=+is%3Aissue+user%3Ahagi17)** to see if the enhancement has already been suggested. If it has, add a comment to the existing issue instead of opening a new one.

#### How Do I Submit A (Good) Enhancement Suggestion?

Enhancement suggestions are tracked as [GitHub issues](https://guides.github.com/features/issues/). Create an issue on that repository and provide the following information:

* **Use a clear and descriptive title** for the issue to identify the suggestion.
* **Provide a step-by-step description of the suggested enhancement** in as many details as possible.
* **Provide specific examples to demonstrate the steps**. Include copy/pasteable snippets which you use in those examples, as [Markdown code blocks](https://help.github.com/articles/markdown-basics/#multiple-lines).
* **Describe the current behavior** and **explain which behavior you expected to see instead** and why.
* **Explain why this enhancement would be useful**.
* **Specify which version you're using.**
* **Specify the name and version of the OS you're using.**

## Styleguides

### Git Commit Messages

* Use the present tense ("Add feature" not "Added feature")
* Use the imperative mood ("Move cursor to..." not "Moves cursor to...")
* Limit the first line to 72 characters or less
* Reference issues and pull requests liberally after the first line
* When only changing documentation, include `[ci skip]` in the commit description

### Documentation Styleguide

* Use [Markdown](https://daringfireball.net/projects/markdown).
* Reference methods and classes in markdown with the custom `{}` notation:
    * Reference classes with `{ClassName}`
    * Reference instance methods with `{ClassName::methodName}`
    * Reference class methods with `{ClassName.methodName}`

## Additional Notes

### Issue and Pull Request Labels

This section lists the labels we use to help us track and manage issues and pull requests. 

[GitHub search](https://help.github.com/articles/searching-issues/) makes it easy to use labels for finding groups of issues or pull requests you're interested in. 

The labels are loosely grouped by their purpose, but it's not required that every issue have a label from every group or that an issue can't have more than one label from the same group.

#### Type of Issue and Issue State

| Label name | :mag_right: | Description |
| --- | --- | --- | --- |
| `enhancement` | [search][search-repo-label-enhancement] |  Feature requests. |
| `bug` | [search][search-repo-label-bug] | Confirmed bugs or reports that are very likely to be bugs. |
| `question` | [search][search-repo-label-question] | Questions more than bug reports or feature requests (e.g. how do I do X). |
| `feedback` | [search][search-repo-label-feedback] | General feedback more than bug reports or feature requests. |
| `more-information-needed` | [search][search-repo-label-more-information-needed] | More information needs to be collected about these problems or feature requests (e.g. steps to reproduce). |
| `needs-reproduction` | [search][search-repo-label-needs-reproduction] | Likely bugs, but haven't been reliably reproduced. |
| `duplicate` | [search][search-repo-label-duplicate] | Issues which are duplicates of other issues, i.e. they have been reported before. |
| `wontfix` | [search][search-repo-label-wontfix] | Decision to not fix these issues for now, either because they're working as intended or for some other reason. |
| `invalid` | [search][search-repo-label-invalid]  | Issues which aren't valid (e.g. user errors). |

#### Topic Categories

| Label name | :mag_right: | Description |
| --- | --- | --- | --- |
| `windows` | [search][search-repo-label-windows] | Related to running on Windows. |
| `linux` | [search][search-repo-label-linux] | Related to running on Linux. |
| `documentation` | [search][search-repo-label-documentation] | Related to any type of documentation. |
| `performance` | [search][search-repo-label-performance] | Related to performance. |
| `security` | [search][search-repo-label-security] | Related to security. |
| `ui` | [search][search-repo-label-ui] | Related to visual design. |
| `crash` | [search][search-repo-label-crash] | Reports of completely crashing. |

---

Adapted from [Atom Contributing.md](https://github.com/atom/atom/blob/master/CONTRIBUTING.md).

Copyright (c) 2011-2017 GitHub Inc.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


[search-repo-label-enhancement]: https://github.com/search?q=is%3Aopen+is%3Aissue+repo%3Ahagi17%2Fpublic+label%3Aenhancement
[search-repo-label-bug]: https://github.com/search?q=is%3Aopen+is%3Aissue+repo%3Ahagi17%2Fpublic+label%3Abug
[search-repo-label-question]: https://github.com/search?q=is%3Aopen+is%3Aissue+repo%3Ahagi17%2Fpublic+label%3Aquestion
[search-repo-label-feedback]: https://github.com/search?q=is%3Aopen+is%3Aissue+repo%3Ahagi17%2Fpublic+label%3Afeedback
[search-repo-label-more-information-needed]: https://github.com/search?q=is%3Aopen+is%3Aissue+repo%3Ahagi17%2Fpublic+label%3Amore-information-needed
[search-repo-label-needs-reproduction]: https://github.com/search?q=is%3Aopen+is%3Aissue+repo%3Ahagi17%2Fpublic+label%3Aneeds-reproduction
[search-repo-label-windows]: https://github.com/search?q=is%3Aopen+is%3Aissue+repo%3Ahagi17%2Fpublic+label%3Awindows
[search-repo-label-linux]: https://github.com/search?q=is%3Aopen+is%3Aissue+repo%3Ahagi17%2Fpublic+label%3Alinux
[search-repo-label-documentation]: https://github.com/search?q=is%3Aopen+is%3Aissue+repo%3Ahagi17%2Fpublic+label%3Adocumentation
[search-repo-label-performance]: https://github.com/search?q=is%3Aopen+is%3Aissue+repo%3Ahagi17%2Fpublic+label%3Aperformance
[search-repo-label-security]: https://github.com/search?q=is%3Aopen+is%3Aissue+repo%3Ahagi17%2Fpublic+label%3Asecurity
[search-repo-label-ui]: https://github.com/search?q=is%3Aopen+is%3Aissue+repo%3Ahagi17%2Fpublic+label%3Aui
[search-atom-repo-label-crash]: https://github.com/search?q=is%3Aopen+is%3Aissue+repo%3Ahagi17%2Fpublic+label%3Acrash
