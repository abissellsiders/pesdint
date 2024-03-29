#' @title Polity 5 dataset
#' @description The Polity 5 project, last updated in 2020, contains data from 1800 to 2018 on the democracy and autocracy of almost all political entities with modern population over 500,000.
#' @references Monty Marshall, Ted Gurr (2020). "Polity Project: Polity 5: Political Regime Characteristics and Transitions, 1800-2018." Center for Systemic Peace.
#' @source Data sources:
#' \itemize{
#' \item Wiki: <https://en.wikipedia.org/wiki/Polity_data_series>
#' \item Page: <https://www.systemicpeace.org/inscrdata.html>
#' \item Data: <http://www.systemicpeace.org/inscr/p5v2018.xls>
#' \item Documentation: <http://www.systemicpeace.org/inscr/p5manualv2018.pdf>
#' }
#' @keywords democracy, autocracy, governance, politics, freedom
#' @format A data table with 17548 rows and 23 variables:
#' \describe{
#' \item{country_code}{master_short country code (converted from Polity 5 country code)}
#' \item{country_name}{master_long country name (converted from Polity 5 country name)}
#' \item{year}{year (1 to 2018)}
#' \item{polity_version}{whether values are from polity IV (not yet reviewed) or polity 5 values (reviewed), only for post-1946 values}
#' \item{polity_flagged}{level of confidence in coding: confident, tentative, tenuous}
#' \item{polity_durability}{years since: 1: 1800; 2: most recent instability (polity_score is -66, -77, -88); 3: most recent regime change (3 point change in polity_score over 3 or fewer years)}
#' \item{polity_score}{sum of democracy score and autocracy score from -10 (max autocratic) to 10 (max democratic); -66 represents foreign occupation; -77 represents collapse of central state power; -88 represents institutional transition (eg, constitutional convention, power consolidation)}
#' \item{polity_score_interpolated}{if polity_score=-66 then NA; if polity_score=-77 then 0; if polity_score=-88 then interpolates values between start and end}
#' \item{polity_democracy}{polity's democracy score; weighted sum of xrcomp, xropen, xconst, parcomp (not xrreg, parreg)}
#' \item{polity_autocracy}{polity's autocracy score; weighted sum of xrcomp, xropen, xconst, parreg, parcomp (not xrreg)}
#' \item{executive_recruitment_regulation}{whether executive recruitment is 1: extralegal seizure of power; 2: elite designation; 3: legal transfer of power}
#' \item{executive_recruitment_competition}{whether executive recruitment is 1: hereditary or elite designation; 2: dual executives (here/desi + comp elec); 3: competitive elections}
#' \item{executive_recruitment_openness}{whether executive recruitment is 1: hereditary, 2: dual executives (here + desi), 3: dual executives (here + open) + elective, 4: open (elite desi or comp elec)}
#' \item{executive_restraints}{whether executive authority is 1: unlimited, 2: intermediate, 3: slightly or moderately limited by the legislature, courts, constitution, or noble council, 4: intermediate, 5: substantially limited, 6: intermediate, 7: has parity with legislature, courts, constitution, or noble council}
#' \item{participation_regulation}{whether political participation is 1: "unregulated" (shifting balances of power with no clear cause), 2: mixture between unregulated and sectarian, 3: "sectarian" (political factions compete to hold power and grant kickbacks to their "side"), 4: "restricted" (non-factional groups exist but some groups are suppressed), or 5: "regulated" (stable political groups compete for power with little coercion and little exclusion)}
#' \item{participation_competitiveness}{whether political competition is 0: not applicable (for "unregulated" above), 1: repressed, 2: suppressed, 3: factional, 4: transitional, 5: competitive}
#' \item{polity_occupation}{polity central authority is interrupted by foreign occupation at any time in this year (code -66; 309 cases): "Operationally, if a country is occupied by foreign powers during war, terminating the old polity, then reestablishes a polity after foreign occupation ends, Polity codes the intervening years as an interruption until an independent polity is reestablished. If foreign powers intervene during an interregnum period in order to provide assistance in re-establishing political order within the Polity, the period of the foreign intervention is coded as an interruption (-77) until a new Polity emerges and establishes independent authority. Periods of interruption are also coded for the participants involved in short-lived attempts at the creation of ethnic, religious, or regional federations."}
#' \item{polity_anarchy}{polity central authority loses control and enters interregnum at any time in this year (code -77; 256 cases): "Indicates periods of "interregnum," during which there is a complete collapse of central political authority. This is most likely to occur during periods of internal war. Lebanon between 1978 and 1986, in which internal factionalism, civil war, and external military intervention has at times reduced the scope of the regime's central authority to a few square blocks of Beirut, is a recent example of an interregnum. .... Moreover, like the "-88" and "-66" codes, a "-77" is entered for the year in which the interregnum began, regardless of the month of its origin, and for each year prior to the year in which central authority is regained or a new polity is established."}
#' \item{polity_transition}{polity central authority transitions to a new government structure at any time in this year (code -88; 452 cases): "Some new polities are preceded by a "transition period" during which new institutions are planned, legally constituted, and put into effect. Democratic and quasi-democratic polities are particularly likely to be so established, in a procedure involving constitutional conventions and referenda. During this period of transition, all authority characteristic indicators are scored "-88"."}
#' \item{polity_unstable}{true if any of polity_occupation, polity_anarchy, or polity_transition are true}
#' \item{polity_transformation}{polity substantially changes territorial borders (codes 96 or 97; 12 cases combined): Code 96: "Denotes the end of a Polity record when the territorial dimensions (and borders) of a state are substantially changed due to a disputed disintegration of administrative units and the appearance of newly independent successor states." Code 97: "Denotes the beginning of a Polity record when the territorial dimensions (and borders) of a state are substantially changed such that a new state formed that is substantially different from the old state and new state codes are assigned. In cases of state transformation, there is continuity between the authority regime of the old Polity and the new Polity (i.e., the old authority regime assumes authority in the new state), for example, North Vietnam (DRV) for united Vietnam (VIE)."}
#' \item{polity_demise}{polity ends voluntarily or involuntarily (code 98; 22 cases): "Denotes the demise of a state and the ending of its Polity record due to its voluntary dissolution (e.g., Czechoslovakia-CZE) or its incorporation in another state (e.g., South Vietnam-RVN-in the united Vietnam-VIE)."}
#' \item{polity_creation}{polity is formed or gains independence (code 99; 172 cases): "Recorded in the year of state independence or formation."}
#' \item{polity_fragmentation}{since 2000: proportion of territory not controlled by the central state: 0\%, 0-10\%, 10-25\%, 25-50\%}
#' }
"govt_polity"
