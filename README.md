# NAME
    loading - A loading animation utility


## DESCRIPTION
    'Loading' utility is a animation tool primarily designed for loading screen. This utility serves many loading instances for embellishment.
    An input string is required to proceed. It loops through a string and changes the cases of letters within a string. User can also changes
    the color of given string's text, cursor color.


## USAGE
    loading [option] [argument]


## FEATURES
    - The color of whole string can be manipulated
    - The color of current iterating character(which we will call it cursor throughout the manual) can be manipulated
    - The color of anything after the cursor can be manipulated
    - The speed of iteration of each character can be manipulated
    - The time out can also be set.


## OPTIONS
    -b [color]
        the background text color. where 'color' is the name of color. Only 'red', 'blue', 'yellow', 'green', 'purple', 
        'orange', and 'pink' are allowed.
    -c [color]
        the cursor(current iterating character) color. Where 'color' is the name of color. Only the color mentioned in -b are allowed.
    -p [color]
        the color of anything right after the cursor. Where 'color' is the name of color. Only the color mentioned in -b are allowed.
    -s [1-5]
        the time of speed of iteration for each character. Where is 1 is equivilent to 0.1 seconds, 2 is 0.4 seconds, 3 is 0.9 seconds
        4 is 1.6 seconds and 5 is 2.5 seconds. The Default speed is 0.16 seconds.
    -t [time]
        the time out of animation. 'time' is the number of seconds. After 'time' seconds the currently running animation will be terminatted. 
        Only positive integers are allowed in -t flag. Default timeout is not set or infinite


## EXAMPLES
    loading -c 'red' -b 'blue' -p 'purple'
    loading -c 'blue' -t 12 -s 1
    loading -p 'red'
    loading -c 'blue' -b 'green' -s 5
    loading -c 'green' -b 'blue' -s 2 -t 9 -p 'green'


## AUTHOR
    Dev Soni


## OPTIONAL
    If you ever meet the creator of "loading animation utility" subsequently you should offer him a hug (optional) or buy him a coffee (optional). Creator
    has complete rights to refuse (which is most unlikely to happen). Do everything which you can do to be awesome.
