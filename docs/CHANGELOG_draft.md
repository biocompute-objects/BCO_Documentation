.. to_doc

${release}
===============================

.. announce_start

Enhancements
-------------------------------

.. major_feature


.. feature

.. enhancement

.. small_enhancement



Fixes
-------------------------------

.. major_bug


.. bug


.. include:: ${release}_prs.rst

===========================================================
${month_name} 20${year} Galaxy Release (v ${release})
===========================================================

.. include:: _header.rst

Highlights
===========================================================

**Feature1**
  Feature description.

**Feature2**
  Feature description.

**Feature3**
  Feature description.

Get Galaxy
==========

The code lives at `GitHub <https://github.com/galaxyproject/galaxy>`__ and you should have `Git <https://git-scm.com/>`__ to obtain it.

To get a new Galaxy repository run:
  .. code-block:: shell

      $$ git clone -b release_${release} https://github.com/galaxyproject/galaxy.git

To update an existing Galaxy repository run:
  .. code-block:: shell

      $$ git fetch origin && git checkout release_${release} && git pull --ff-only origin release_${release}

See the `community hub <https://galaxyproject.org/develop/source-code/>`__ for additional details regarding the source code locations.

Release Notes
===========================================================

.. include:: ${release}.rst
   :start-after: announce_start

.. include:: _thanks.rst

===========================================================
${month_name} 20${year} Galaxy Release (v ${release})
===========================================================

.. include:: _header.rst

Highlights
===========================================================

**Feature1**
  Feature description.

**Feature2**
  Feature description.

**Feature3**
  Feature description.


New Visualizations
===========================================================

.. visualizations

New Datatypes
===========================================================

.. datatypes

Builtin Tool Updates
===========================================================

.. tools

Release Notes
===========================================================

Please see the `full release notes <${release}_announce.html>`_ for more details.

.. include:: ${release}_prs.rst

.. include:: _thanks.rst
""")

NEXT_TEMPLATE = string.Template("""
===========================================================
${month_name} 20${year} Galaxy Release (v ${version})
===========================================================


Schedule
===========================================================
 * Planned Freeze Date: ${freeze_date}
 * Planned Release Date: ${release_date}
 

 - [X] **Prep**

     - [X] ~~Create this release issue ``make release-issue RELEASE_CURR=${version}``.~~
     - [X] ~~Set freeze date (${freeze_date}).~~

 - [ ] **Branch Release (on or around ${freeze_date})**

     - [ ] Ensure all [blocking milestone PRs](https://github.com/galaxyproject/galaxy/pulls?q=is%3Aopen+is%3Apr+milestone%3A${version}) have been merged, delayed, or closed.

           make release-check-blocking-prs RELEASE_CURR=${version}
     - [ ] Merge the latest release into dev and push upstream.

           make release-merge-stable-to-next RELEASE_PREVIOUS=release_${previous_version}
           make release-push-dev

     - [ ] Create and push release branch:

           make release-create-rc RELEASE_CURR=${version} RELEASE_NEXT=${next_version}

     - [ ] Open PRs from your fork of branch ``version-${version}`` to upstream ``release_${version}`` and of ``version-${next_version}.dev`` to ``dev``.
     - [ ] Update ``next_milestone`` in [P4's configuration](https://github.com/galaxyproject/p4) to `${next_version}` so it properly tags new PRs.
     - [ ] Set the ``release_${version}`` branch in GitHub [settings](https://github.com/galaxyproject/galaxy/settings/branches) as protected.

 - [ ] **Issue Review Timeline Notes**
     - [ ] Ensure any security fixes will be ready prior to ${freeze_date} + 1 week, to allow time for notification prior to release.
     - [ ] Ensure ownership of outstanding bugfixes and track progress during freeze.

 - [ ] **Deploy and Test Release**

     - [ ] Update test.galaxyproject.org to ensure it is running a dev at or past branch point (${freeze_date} + 1 day).
     - [ ] Update testtoolshed.g2.bx.psu.edu to ensure it is running a dev at or past branch point (${freeze_date} + 1 day).
     - [ ] Deploy to usegalaxy.org (${freeze_date} + 1 week).
     - [ ] Deploy to toolshed.g2.bx.psu.edu (${freeze_date} + 1 week).
     - [ ] [Update BioBlend CI testing](https://github.com/galaxyproject/bioblend/commit/b74b1c302a1b8fed86786b40d7ecc3520cbadcd3) to include a ``release_${version}`` target: add ``- TOX_ENV=py27 GALAXY_VERSION=release_${version}`` to the ``env`` list in ``.travis.yml`` .

 - [ ] **Create Release Notes**

     - [ ] Review merged PRs and ensure they all have a milestones attached. [Link](https://github.com/galaxyproject/galaxy/pulls?utf8=%E2%9C%93&q=is%3Apr+is%3Amerged+no%3Amilestone+-label%3Amerge+)
     - [ ] Checkout release branch

           git checkout release_${version} -b ${version}_release_notes
     - [ ] Check for obvious missing metadata in release PRs

           make release-check-metadata RELEASE_CURR=${version}
     - [ ] Bootstrap the release notes

           make release-bootstrap-history RELEASE_CURR=${version}
     - [ ] Open newly created files and manually curate major topics and release notes.
     - [ ] Commit release notes.

           git add docs/; git commit -m "Release notes for $version"; git push upstream ${version}_release_notes
     - [ ] Open a pull request for new release note branch.
     - [ ] Merge release note pull request.

 - [ ] **Do Release**

     - [ ] Ensure all [blocking milestone issues](https://github.com/galaxyproject/galaxy/issues?q=is%3Aopen+is%3Aissue+milestone%3A${version}) have been resolved.

           make release-check-blocking-issues RELEASE_CURR=${version}
     - [ ] Ensure all [blocking milestone PRs](https://github.com/galaxyproject/galaxy/pulls?q=is%3Aopen+is%3Apr+milestone%3A${version}) have been merged or closed.

           make release-check-blocking-prs RELEASE_CURR=${version}
     - [ ] Ensure previous release is merged into current. [GitHub branch comparison](https://github.com/galaxyproject/galaxy/compare/release_${version}...release_${previous_version})
     - [ ] Create and push release tag:

           make release-create RELEASE_CURR=${version}

     - [ ] Add the branch `*/release_{version}` to Jenkins documentation build [configuration matrix](https://jenkins.galaxyproject.org/job/galaxy-sphinx-by-branch/configure).
     - [ ] Trigger the [branch documentation build](https://jenkins.galaxyproject.org/job/galaxy-sphinx-by-branch/)
     - [ ] Verify that everything is merged from ${version}->master, and then trigger the ['latest' documentation build](https://jenkins.galaxyproject.org/job/latest-Sphinx-Docs/)

 - [ ] **Do Docker Release**

     - [ ] Change the [dev branch](https://github.com/bgruening/docker-galaxy-stable/tree/dev) of the Galaxy Docker container to ${next_version}
     - [ ] Merge dev into master

 - [ ] **Ensure Tool Tests use Latest Release**

     - [ ]  Update GALAXY_RELEASE in https://github.com/galaxyproject/tools-iuc/blob/master/.travis.yml#L6
     - [ ]  Update GALAXY_RELEASE in https://github.com/galaxyproject/tools-devteam/blob/master/.travis.yml#L6

 - [ ] **Announce Release**

     - [ ] Verify release included in https://docs.galaxyproject.org/en/master/releases/index.html
     - [ ] Review announcement in https://github.com/galaxyproject/galaxy/blob/dev/doc/source/releases/${version}_announce.rst
     - [ ] Stage announcement content (Hub, Galaxy Help, etc.) on announce date to capture date tags. Note: all final content does not need to be completed to do this.
     - [ ] Create hub *highlights* and post as a new "news" content item. [An example](https://galaxyproject.org/news/2018-9-galaxy-release/).
     - [ ] Tweet docs news *highlights* link as @galaxyproject on twitter. [An example](https://twitter.com/galaxyproject/status/973646125633695744).
     - [ ] Post *highlights* with tags `news` and `release` to [Galaxy Help](https://help.galaxyproject.org/). [An example](https://help.galaxyproject.org/t/galaxy-release-19-01/712).
     - [ ] Email *highlights* to [galaxy-dev](http://dev.list.galaxyproject.org/) and [galaxy-announce](http://announce.list.galaxyproject.org/) @lists.galaxyproject.org. [An example](http://dev.list.galaxyproject.org/The-Galaxy-release-16-04-is-out-tp4669419.html)
     - [ ] Adjust http://getgalaxy.org text and links to match current master branch by opening a PR at https://github.com/galaxyproject/galaxy-hub/

 - [ ] **Prepare for next release**

     - [ ] Close milestone ``${version}`` and ensure milestone ``${next_version}`` exists.
     - [ ] Create release issue for next version ``make release-issue RELEASE_CURR=${next_version}``.
     - [ ] Schedule committer meeting to discuss re-alignment of priorities.
     - [ ] Close this issue.
	 
git log master..dev --pretty=format:'{%n  "commit": "%H",%n  "author": "%aN",%n  "email": "%aE",%n  "date": "%ad",%n  "subject": "%f",%n  "message": "%b"%n},'     $@ |     perl -pe 'BEGIN{print "["}; END{print "]\n"}' |     perl -pe 's/},]/}]/' > change.json