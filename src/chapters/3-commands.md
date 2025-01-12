\newpage
# Commands

Commands are executed at parse-time. The generic syntax to a command is:

```
<keyword> <command-specific-syntax> ;
```

All commands ends with a semicolon.

## include

The `include` command includes another module content on the same position where it's command
is used. The included module is parsed and executed in the same time at the `include` command
is executed. The syntax is:

```
include "<module-path>";
```

* `<module-path>` is the relative or absolute path to module's file to include, using `/` as
  directory separator. A path starting with `/` means an absolute path, where it's start on
  the current filesystem root. Relative paths will be relative starting from a common path
  where it's considered the "current working directory", and not relative from where the
  module is.

### Examples

```
include "modules/registers.mya";
include "config.mya";
include "/etc/mya/modules/common.mya";
```

## set

The `set` command sets the value of a global variable, that could be used on any expression.
The syntax is:

```
set <name> = <value>;
```

* `<name>` is the name for the variable to change/create. Should start with a letter followed by
  any combination of `[a-z][A-Z][0-9]_` characters.
* `<value>` is any valid expression to be evaluate as the variable's value.

### Examples

```
set A = 2;
set B = A + 5;
```
