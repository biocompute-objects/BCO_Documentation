BioCompute Release Protocol
===========================
 
**Major (compatibility affected) Software Releases**

This the protocol for releasing updates to the [master branch](https://github.com/biocompute-objects/BCO_Specification/tree/master) when the software updates affect the compatibility of previous releases.  

1.	Standard system tests – As the changes and bugs are fixed in the [dev branch](https://github.com/biocompute-objects/BCO_Specification/tree/dev), the [dev branch](https://github.com/biocompute-objects/BCO_Specification/tree/dev) needs to be tested as the new changes are implemented on a piecemeal basis. 
2.	Create release notes – Create a list of the particular issues (software changes) to be included in this software release and draft a “Release Notes” document.  This “Release Notes” document should include the software version number (e.g. 3.1.0) and contain a list of each change with the comit hash, title, and brief description of the change from a user perspective.
5.	Schedule release date – Schedule a date at least 10 days in the future.  This buffer will allow time for further testing.

**Minor (compatibility not affected) Software Releases**

This the protocol for releasing updates to the [master branch](https://github.com/biocompute-objects/BCO_Specification/tree/master) when the update changes don’t affect the compatibility of previous releases.

1.	Standard system tests – As the changes and bugs are fixed in the [dev branch](https://github.com/biocompute-objects/BCO_Specification/tree/dev), the [dev branch](https://github.com/biocompute-objects/BCO_Specification/tree/dev) needs to be tested as the new changes are implemented on a piecemeal basis. 
2.	Create release notes – Create a list of the particular issues (software changes) to be included in this software release and draft a “Release Notes” document.  This “Release Notes” document should include the software version number (e.g. 3.01) and contain a list of each change with the Unfuddle ticket number, title, and brief description of the change from a user perspective.cx
4.	Final round of Quality Assurance testing – After the release date is scheduled, a final round of QA testing needs to occur in the [dev branch](https://github.com/biocompute-objects/BCO_Specification/tree/dev) (all changes should be in the [dev branch](https://github.com/biocompute-objects/BCO_Specification/tree/dev) and already have gone through numbers rounds of bug testing) to ensure a bug is not being introduced into the production environment. 
5.	Promote changes to Production – Once a full round of QA testing is successful without any new bugs, the changes are ready to be promoted to production.  

