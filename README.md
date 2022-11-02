# Overview
This repo contains bricks used by the [mason_cli](https://pub.dev/packages/mason_cli) package. To add them to your local machine, simply follow the instructions underneath the [Add Usage](https://pub.dev/packages/mason_cli#add-usage) section of the mason_cli home page.

I primarily code using the [stacked](https://pub.dev/packages/stacked) architecture by FilledStacks so many of the bricks below generate "stacked" code. This typically includes a View and a corresponding ViewModel.

## Bricks
### Responsive View
The responsive view brick generates a single view that will resize itself responsively based on the dimensions of the screen it is displayed on. Breakpoints are determined using the [breakpoint](https://pub.dev/packages/breakpoint) package.

The responsive view brick (rview) uses the following architecture:

 - **base**
	 - **layouts**
		 - small.dart
		 - medium.dart
		 - large.dart
	 - **widgets**
	 - base_view.dart
	 - base_view_model.dart

The **layouts** folder will contain small, medium, and large layout files. The expectation is that these layout files will arrange widgets in the **widgets** folder in ways that are appropriate for the given screen size.

To install:

    mason add -g go-main --git-url https://github.com/jtmuller5/mullr-bricks --path mason/bricks
    
To use:

    mason make rview --name name
