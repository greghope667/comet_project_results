Output from https://github.com/greghope667/comet_project code run on entire Kepler dataset.

Output format is a table in text format, designed to be analysed with command line tools (e.g. grep, awk). Opening in spreadsheet software also works. The data is split into 17 text files, one for each quarter, due to github file size limits.


Columns in table are:

(1) Light curve file name, containing Kepler ID and date.

(2) Transit signal strength, as determined by box fit test statistic.

(3) Signal to noise of the detection.

(4) Kepler date of the detected event.

(5) Asymmetry of the event.

The next two columns are parameters from the asymmetric comet curve fit:

(6) Transit entry scale length.

(7) Transit exit scale length.

Two columns of box fit parameters:

(8) Box width, giving estimate for transit width.

(9) Box depth, giving estimate for transit depth.

Finally, (10) performs some very basic classification of events, to remove common artefacts. There are four possible values here:

- point - Event is 1-2 data points wide, probably an error (e.g. cosmic ray), and too short for meaningful shape analysis.
   
- end - Event occurs at the end of a light curve. This is typically due to small errors in removing periodic signals in some very variable light curves, such as those from red giant stars.
  
- artefact - Event occurs directly after segment of missing data. These may be artefacts from PDC fitting, so analysis of raw flux is required to categorise these events.

- maybeTransit - Event not ruled out as transit by any of the above filters.


Also included is an example awk script for filtering. Running

    awk -f filters.awk out_public* | sort -nk 4

returns 24 events with SNR > 8, asymmetry > 1.1
