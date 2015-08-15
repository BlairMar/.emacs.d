;; Default agenda preferences

;; Exclude SCHEDULED items from agenda view (does not work)
;; (setq org-agenda-todo-ignore-scheduled 'all)
;; (setq org-agenda-tags-todo-honor-ignore-options t)
;; Exclude all non-deadline and timestamp entries from the agenda
;; (setq org-agenda-entry-types '(:deadline :timestamp))

;; Only show deadlines if they're past due
(setq org-deadline-warning-days 0)

;; Show times with AM/PM rather than 24 hours
(setq org-agenda-timegrid-use-ampm t)

;; Show agenda on startup
;; (add-hook 'after-init-hook 'my/org-agenda-startup)

;; (defun my/org-agenda-startup ()
;;   (org-agenda-list)
;;   (org-agenda-earlier 1)
;;   (org-agenda-fortnight-view))

;; Custom agenda commands to quickly view lists of relevent data
(setq org-agenda-custom-commands
      '(
        ;; Automatically show agenda ordered by date
        ("1" . "Custom agenda views")

        ;; For all TASKS
        ("1t" agenda "Tasks agenda (active only)"
         (
          (org-agenda-skip-function
           '(org-agenda-skip-entry-if 'nottodo '("TODO" "WAITING" "CANCELLED" "DELEGATED" "DONE")))
          ;; (org-agenda-include-inactive-timestamps 't)
          )
         )

        ;; For all POSSESSIONS
        ("1p" agenda "Possessions agenda (active and inactive)"
         (
          (org-agenda-skip-function
           '(org-agenda-skip-entry-if 'nottodo '("PURCHASE" "PURCHASED" "TRANSIT" "SELL" "LOANED" "UNWANTED" "OWN" "GIFTED" "SOLD" "DISCARDED")))
          (org-agenda-include-inactive-timestamps 't)
          )
         )

        ;; For all MULTIMEDIA
        ("1m" agenda "Multimedia agenda (active and inactive)"
         (
          (org-agenda-skip-function
           '(org-agenda-skip-entry-if 'nottodo '("CONSUME" "CONSUMING" "SUBSCRIBE" "SHARE" "IGNORE" "REFERENCE")))
          (org-agenda-include-inactive-timestamps 't)
          )
         )

        ;; For all EVENTS
        ("1e" agenda "Events agenda (active)"
         (
          (org-agenda-skip-function
           '(org-agenda-skip-entry-if 'nottodo '("VISIT" "DIDNOTGO" "VISITED")))
          ;; (org-agenda-include-inactive-timestamps 't)
          )
         )

        ;; For all FINANCES; requires the :fin: tag
        ("1f" agenda ":fin: agenda (active)"
         (
          (org-agenda-filter-preset '("+fin")) ;; instead of org-agenda-tag-filter-preset and org-agenda-filter-by-tag
          ;; (org-agenda-include-inactive-timestamps 't)
          )
         )

        ;; For all NOTES; requires the :note: tag
        ("1n" agenda ":note: agenda (inactive)"
         (
          (org-agenda-filter-preset '("+note")) ;; instead of org-agenda-tag-filter-preset and org-agenda-filter-by-tag
          (org-agenda-include-inactive-timestamps 't)
          )
         )

        ;; Automatically show table view in agenda mode ordered by date
        ("2" . "Custom sorted tables")

        ;; For all TASKS; requires the properties described in org-agenda-overriding-columns-format
        ("2t" agenda "Tasks agenda table (active only)"
         (
          (org-agenda-skip-function
           '(org-agenda-skip-entry-if 'nottodo '("TODO" "WAITING" "CANCELLED" "DELEGATED" "DONE")))
          ;; (org-agenda-include-inactive-timestamps 't)
          (org-agenda-overriding-columns-format "%75ITEM %36ID %100Note")
          (org-agenda-view-columns-initially t)
          )
         )

        ;; For all POSSESSIONS; requires the properties described in org-agenda-overriding-columns-format
        ("2p" agenda "Possessions agenda table (active and inactive)"
         (
          (org-agenda-skip-function
           '(org-agenda-skip-entry-if 'nottodo '("PURCHASE" "TRANSIT" "SELL" "LOANED" "UNWANTED" "OWN" "GIFTED" "SOLD" "DISCARDED")))
          (org-agenda-include-inactive-timestamps 't)
          (org-agenda-overriding-columns-format "%50ITEM %10Cost %10Paid %20Merchant %20Method %20Note")
          (org-agenda-view-columns-initially t)
          )
         )

        ;; For all MULTIMEDIA; requires the properties described in org-agenda-overriding-columns-format
        ("2m" agenda "Multimedia agenda table (active and inactive)"
         (
          (org-agenda-skip-function
           '(org-agenda-skip-entry-if 'nottodo '("CONSUME" "SUBSCRIBE" "SHARE" "IGNORED" "REFERENCE")))
          (org-agenda-include-inactive-timestamps 't)
          (org-agenda-overriding-columns-format "%11ITEM %10Creator %50Created %10Source %20Link %16Date %20Note")
          (org-agenda-view-columns-initially t)
          )
         )

        ;; For all EVENTS; requires the properties described in org-agenda-overriding-columns-format
        ("2e" agenda "Events agenda table (active)"
         (
          (org-agenda-skip-function
           '(org-agenda-skip-entry-if 'nottodo '("VISIT" "PLANNED" "DIDNOTGO" "MEETING" "VISITED")))
          ;; (org-agenda-include-inactive-timestamps 't)
          (org-agenda-overriding-columns-format "%50ITEM %50Attend %20Location %20Note")
          (org-agenda-view-columns-initially t)
          )
         )

        ;; For all FINANCES; requires the :fin: tag and the properties described in org-agenda-overriding-columns-format
        ("2f" agenda ":fin: agenda table (active)"
         (
          (org-agenda-filter-preset '("+fin")) ;; instead of org-agenda-tag-filter-preset and org-agenda-filter-by-tag
          ;; (org-agenda-include-inactive-timestamps 't)
          (org-agenda-overriding-columns-format "%50ITEM %10Cost %10Paid %20Merchant %20Method %20Note")
          (org-agenda-view-columns-initially t)
          )
         )

        ;; For all NOTES; requires the :note: tag and the properties described in org-agenda-overriding-columns-format
        ("2n" agenda ":note: agenda table (inactive)"
         (
          (org-agenda-filter-preset '("+note")) ;; instead of org-agenda-tag-filter-preset and org-agenda-filter-by-tag
          (org-agenda-include-inactive-timestamps 't)
          (org-agenda-overriding-columns-format "%75ITEM %36ID %75Note")
          (org-agenda-view-columns-initially t)
          )
         )

        ;; Automatically show agenda mode ordered as found
        ("3" . "Custom lists")

        ;; For all TASKS
        ("3t" "Tasks list (active only)" todo "TODO|WAITING|CANCELLED|DELEGATED|DONE"
         (
          ;; (org-agenda-include-inactive-timestamps 't)
          )
         )

        ;; For all POSSESSIONS
        ("3p" "Possessions list (active and inactive)" todo "PURCHASE|TRANSIT|SELL|LOANED|UNWANTED|OWN|GIFTED|SOLD|DISCARDED"
         (
          (org-agenda-include-inactive-timestamps 't)
          )
         )

        ;; For all MULTIMEDIA
        ("3m" "Multimedia list (active and inactive)" todo "CONSUME|SUBSCRIBE|SHARE|IGNORED|REFERENCE"
         (
          (org-agenda-include-inactive-timestamps 't)
          )
         )

        ;; For all EVENTS
        ("3e" "Events list (active)" todo "VISIT|PLANNED|DIDNOTGO|MEETING|VISITED"
         (
          ;; (org-agenda-include-inactive-timestamps 't)
          )
         )

        ;; For all finances; requires them to have the :fin: tag
        ("3f" ":fin: list (active)" tags "fin"
         (
          ;; (org-agenda-include-inactive-timestamps 't)
          )
         )

        ;; For all NOTES; requires the :note: tag and the properties described in org-agenda-overriding-columns-format
        ("3n" ":note: list (inactive)" tags "note"
         (
          (org-agenda-include-inactive-timestamps 't)
          )
         )

        ;; Automatically show table view in agenda mode ordered as found
        ("4" . "Custom list tables")

        ;; For all TASKS; requires the properties described in org-agenda-overriding-columns-format
        ("4t" "Tasks list table (active only)" todo "TODO|WAITING|CANCELLED|DELEGATED|DONE"
         (
          ;; (org-agenda-include-inactive-timestamps 't)
          (org-agenda-overriding-columns-format "%75ITEM %36ID %100Note")
          (org-agenda-view-columns-initially t)
          )
         )

        ;; For all POSSESSIONS; requires the properties described in org-agenda-overriding-columns-format
        ("4p" "Possessions list table (active and inactive)" todo "PURCHASE|TRANSIT|SELL|UNWANTED|LOANED|OWN|GIFTED|SOLD|DISCARDED"
         (
          (org-agenda-include-inactive-timestamps 't)
          (org-agenda-overriding-columns-format "%50ITEM %10Cost %10Paid %20Merchant %20Method %20Note")
          (org-agenda-view-columns-initially t)
          )
         )

        ;; For all MULTIMEDIA; requires the properties described in org-agenda-overriding-columns-format
        ("4m" "Multimedia list table (active and inactive)" todo "CONSUME|SUBSCRIBE|SHARE|IGNORED|REFERENCE"
         (
          (org-agenda-include-inactive-timestamps 't)
          (org-agenda-overriding-columns-format "%11ITEM %10Creator %50Created %10Source %20Link %16Date %20Note")
          (org-agenda-view-columns-initially t)
          )
         )

        ;; For all EVENTS; requires the properties described in org-agenda-overriding-columns-format
        ("4e" "Events list table (active)" todo "VISIT|PLANNED|DIDNOTGO|MEETING|VISITED"
         (
          ;; (org-agenda-include-inactive-timestamps 't)
          (org-agenda-overriding-columns-format "%50ITEM %50Attend %20Location %20Note")
          (org-agenda-view-columns-initially t)
          )
         )

        ;; For all finances; requires them to have the :fin: tag and the properties described in org-agenda-overriding-columns-format
        ("4f" ":fin: list table (active)" tags "fin"
         (
          ;; (org-agenda-include-inactive-timestamps 't)
          (org-agenda-overriding-columns-format "%50ITEM %10Cost %10Paid %20Merchant %20Method %20Note")
          (org-agenda-view-columns-initially t)
          )
         )

        ;; For all NOTES; requires the :note: tag and the properties described in org-agenda-overriding-columns-format
        ("4n" ":note: list table (inactive)" tags "note"
         (
          (org-agenda-include-inactive-timestamps 't)
          (org-agenda-overriding-columns-format "%75ITEM %36ID %75Note")
          (org-agenda-view-columns-initially t)
          )
         )
        )
      )
