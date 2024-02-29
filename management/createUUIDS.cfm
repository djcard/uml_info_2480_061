<ul> 
    <cfoutput> 
        <cfloop from="1" to="20" index="I"> 
            <li>#createuuid()#</li> 
        </cfloop> 
   </cfoutput>
 </ul>
   
  i had to drop the quotes in line 3 for the data to display
 <ul> 
    <cfoutput> 
        <cfloop from= 1 to=20 index=I> 
            <li>#createuuid()#</li> 
        </cfloop> 
   </cfoutput>
</ul>