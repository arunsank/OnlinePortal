# OnlinePortal
Designing a Movie and Music online portal using XML and XSLT
3 separate XML files of the same format have been used for easier understanding. This can also be done with a single XML file by using a front end interface. This is not in scope for this project and hence that has not been handled
# XML file
The file is a collection of nodes. Node traversal could be done to extract data
Parent node - Store
Sub nodes 1 - Music , Video
Sub nodes 2 - Album , Movie
The sub nodes have column attributes and some have type attributes

# XSLT file
The XSLT files do the stylesheet transformations

template1.xslt - Used to display a high level movie and video counts. It displays movies that are not available in bolded red color
The albums are conditioned to only display the albums that are available (i.e availability count is >0)

template2.xslt - Displays studio and label information and their respective counts. The main problem here is that the studio and labels would be repeated multiple times as each studio may release multiple albums from multiple artists. Hence we count the studios using preceding-sibling keyword in xslt to make sure the same movie is not counted again.


template3.xslt - Displays a high level view for the user to see the availability of movies and albums and their prices. Displays unavailable movies and rows in red color



# stylinginfo.css
The css files that contain the styling information

# Accessible links
Use the below links to view the above xml data

http://cgi.soic.indiana.edu/~arunsank/view1.xml

http://cgi.soic.indiana.edu/~arunsank/view2.xml

http://cgi.soic.indiana.edu/~arunsank/view3.xml







