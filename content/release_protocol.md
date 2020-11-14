BioCompute Release Protocol
=========================== 

 - [x] **Prep**
     - ~~[x] Create a release issue: release_1.4.0.~~
     - ~~[x] Set freeze date freeze date [1/24/2020].~~
 - [ ] **Branch Release (on or around freeze date)**
     - [ ] Ensure all [blocking milestone issues](https://github.com/biocompute-objects/BCO_Specification/milestones) have been closed.
     - [ ] Merge the latest release into dev and push upstream.
 - [ ] **Deploy and Test Release**
     - [ ] Review issues and ensure they all have a milestones attached. [Link](https://github.com/biocompute-objects/BCO_Specification/milestones)
     - [ ] Checkout release branch.
	 - [ ] Run `schemas/validate.py` on each of the examples in `examples/*`, updating if necessary.
     - [ ] Check for obvious missing or inconsistent documentation in release.
 - [ ] **Create Release Notes**
     - [ ] Open newly edited/created files and manually curate for accuracy.
     - [ ] If any changes are made, ensure you commit branch again and document in commit what was changed.
     - [ ] Run `sh scripts/log.sh` from the repo root.
     - [ ] Check for obvious missing or inconsistent documentation in release notes (`CHANGELOG.md`).
     - [ ] Commit branch.
 - [ ] **Do Release**
     - [ ] Ensure all [blocking milestone issues](https://github.com/biocompute-objects/BCO_Specification/milestones) have been resolved.
     - [ ] Create and push new release tag.
 - [ ] **Announce Release**

     - [ ] Verify release included in https://github.com/biocompute-objects/BCO_Specification/releases
     - [ ] Review announcement on **https://biocomputeobject.org/**
     - [ ] Tweet docs news *highlights* link as @BioComputeObj on twitter. [@kee007ney will provide an example in the future](https://twitter.com/BioComputeObj).
     - [ ] Email *highlights* to listserv [@kee007ney will provide an example in the future](https://twitter.com/BioComputeObj)..

 - [ ] **Prepare for next release**
     - [ ] Close milestone ``${version}`` and ensure milestone ``${next_version}`` exists.
     - [ ] Create release issue for next version ``release_${next_version}``.
     - [ ] Close this issue.