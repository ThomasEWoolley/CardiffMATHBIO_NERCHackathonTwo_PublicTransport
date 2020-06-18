# NERC COVID-19 Hackathon Two: Recovery

This repository is Cardiff University MATHBIO's entry to <a href="https://digitalenvironment.org/home/covid-19-digital-sprint-hackathons/covid-19-hackathon-2-recovery/" target="_blank">**COVID-19 Hackathon 2: Recovery**</a>.

## <span style="color:blue">GOAL: Reduce public transport emissions per person by creating a tool that will present an optimal seating arrangement under social distancing.</span>
## RESULT: The seating optimiser app is published <a href="https://lucyhenley.shinyapps.io/CardiffMATHBIO_NERCHackathonTwo_PublicTransport/" target="_blank">**here**</a>. 

---

## Table of Contents

- [Introduction](#introduction)
- [Background](#background)
- [Transport Capacity](#transport-capacity)
- [Shielding](#shielding)
- [Emissions](#emissions)
- [The GUI](#the-gui)
- [Team](#team)


---

![Emissions per passenger](https://github.com/Lucyhenley/CardiffMATHBIO_NERCHackathonTwo_PublicTransport/blob/master/figs/screenshot.png?raw=true)
*The app presents an optimal seating strategy of a train under specific conditions.*

![capacity of train](https://github.com/Lucyhenley/CardiffMATHBIO_NERCHackathonTwo_PublicTransport/blob/master/figs/max_capacity.png?raw=true)
*The app demonstrates how social distancing conditions influences the maximum capacity of a train.*

---
## Introduction
During lockdown, usage of all forms of motorised transport fell, due to travel restrictions. However, as the UK eases lockdown measures, use of public transport remains low, due to safety concerns. Equally, people, who previously used public transport, are now choosing to use personal motor vehicles instead, resulting in increased travel emissions.

To solve this problem, we have designed an app that optimises the number, and seating arrangement, of people who can safely use public transport to encourage its use, as an alternative to commuting by car. The app allows the user to see the optimal spacing strategy in various scenarios of social distancing and includes the option of using plastic shielding, for increased isolation.

Although the app was primarily designed to feed into governmental policy making and help train companies make decisions on how to design and optimise carriage use, the app can also be used by passengers to suggest their optimal seating placement.
We have used the app to isolate specific combinations of measures needed to make public transport have lower emissions than using cars.

The project meets the requirements of the hackathon in the following ways:

- **Specific**- We have designed an app to address a negative aspect of lockdown on UK emissions, that of decreased public transport usage. Our results optimise passenger capacity and their safety. 
- **Measurable**- The app outputs an expected “emissions per passenger” for any given seating arrangement, or shielding pattern, in grams of CO2 per person per kilometre. We can therefore directly quantify the effect our solutions will have on UK emissions.
- **Achievable**- Solutions depend only on the ability to implement plastic shielding and/or alter social distancing to be 2 metres, or less. Further, the app works in real time and is easily updateable, so achievable results can be fed directly into government policy and public transport design. Finally, due to the app being online and user-friendly, the app can be used anywhere, anytime, by anyone.
- **Relevant**- Our focus on optimising public transport usage following lockdown is relevant to developing recovery measures for meeting the Paris Climate Agreement and net zero emission targets. The app will help governments and businesses maximise their use of resources, whilst minimising their impact on the environment through reducing emissions, which is a core component of the NERC remit.
- **Timebound**- We have completed development of a user-friendly app that provides the user with instantaneous optimal seating suggestions based on their social distancing strategy. We have, further, used the app to derive combinations that fully optimise specific public transport geometries. Given more time the app could be extended to include XXXFILL THIS IN WITH SOMETHING, SUCH AS YOU COULD ADD FURTHER PUBLIC TRANSPORT GEOMETRIESXXX, which would extend its usefulness.


## Background

[During lockdown, restrictions on travel led to large reductions in the use of cars and public transport across the UK](https://www.gov.uk/government/statistics/transport-use-during-the-coronavirus-covid-19-pandemic). By 12th April 2020 use of cars fell as low as 22%, compared to a typical day in 2019. Public transport use also fell with National Rail usage reduced to 4% and busses outside of London reduced to 10% [CITATION?].

This reduction in travel contributed to overall reductions in emissions, but as lockdown measures are relaxed, personal vehicle usage has increased again, approaching 70% of typical values from 2019 by 15th June 2020. Unfortunately, use of public transport remains low, with National Rail and busses outside of London running at 8% and 14% of normal usage, respectively. This suggests that people are choosing to use personal motor vehicles, as opposed to public transport and, due to safety concerns, this could be a possible long-term consequence of the COVID-19 pandemic.

[Reducing emissions from travelling is a key component for the UK in meeting the Paris Accord, as road transport makes up around 20% of UK greenhouse emissions](https://www.ons.gov.uk/economy/environmentalaccounts/articles/roadtransportandairemissions/2019-09-16). Encouraging people to choose public transport instead of personal vehicles leads to a reduction in emissions per person, so we need some way of facilitating the usage of public transport to prevent an increase in emissions from travel.

Assuming there is demand for public transport, the greatest factor limiting its use becomes the number of people who can safely fit into a carriage under current restriction measures, which we denote by 'transport capacity'.


---

## Transport capacity

One restriction on the number of people using public transport is the effect of social distancing. In the UK, social distancing requires that people remain 2 metres away from one another to minimise the risk of transmission of disease, which also applies to seating on public transport, resulting in many seats becoming unusable. A train or bus can quickly become 'full' with only a fraction of its total capacity on board, as all remaining empty seats are within 2 metres of another passenger.

To address this problem, we have designed an app that determines the maximum capacity of a train or bus, depending on the radius of social distancing. This app also demonstrates where these passengers should be sitting to achieve this capacity. This is achieved for the class 150 sprinter train and the Dennis Dart bus, as examples, but future work could generalise the app for any model.

---
## The GUI

The app uses a Graphical User Interface (GUI) to allow easy manipulation of input variables. There are sliders for:
* the number of social distancing shields used;
* the length of the shields;
* and the social distancing distance.

Given these input values, the app reports the optimal number of seats which can be used in the train, their locations within the train and the emissions per passenger.

Graphics are included which demonstrate the emissions per person, dependent on the number of passengers who can fit safely into the carriage. We also plot the emissions per passenger of small and large cars, so that we can identify the exact number of passengers requires per carriage to make public transport a lower-emission method of travel.

The GUI is published <a href="https://lucyhenley.shinyapps.io/CardiffMATHBIO_NERCHackathonTwo_PublicTransport/" target="_blank">**here**</a>. 

---

## Shielding
Many industries have taken to the use of plastic barriers, or 'shields', which can ease the effect of social distancing by placing a physical barrier between people to prevent transmission of disease. Such shields can be applied to public transport, in order to maximise the capacity of public transport and ensure that passengers feel safe whilst travelling.

We define some basic shielding patterns in the app and include the effect of shields 'blocking' transmission of disease to increase the number of people who can safely use public transport. A possible side effect is that we can demonstrate multiple shielding patterns which achieve the same capacity, but use different quantities of shielding material. As most shielding is made of plastic, reducing the volume of plastic required has additional benefits in reducing pollution.

---

## Emissions
If public transport cannot meet demand, then passengers will need to find alternative means of getting to their destination, for example, using personal motor vehicles. By maximising the number of people who can fit into a train, or bus, for a given social distancing measure, we can minimise the number of people who need to drive and therefore reduce emissions from travel as a result of COVID-19.

To calculate and quantify the effect of capacity of public transport on overall emissions, we use data relating to the emissions of cars used for commuting to work. A train uses a roughly fixed amount of energy to run irrespective of the number of passengers using it, so train emissions per passenger fall as passenger capacity increases. Train emissions are found [here]( https://laqm.defra.gov.uk/documents/AEAPTEGCarbonFootprintingfinalversion2009.pdf).

Car emission data is taken from measurements of the emissions generated by cars used for commuting, found [here](http://www.aef.org.uk/downloads/Grams_CO2_transportmodesUK.pdf).

As a worst case scenario, we assume that all passengers who cannot fit onto a train would instead choose commute by car, meaning that they now contribute to the car emission data. Based on these assumptions, we can plot the emissions per passenger for a train, a bus, a small car and a large car, and thus effectively denote how many passengers are required on a mode of public transport to make them more efficient with regards to emissions than a method of personal transport.


![Emissions per passenger](https://github.com/Lucyhenley/CardiffMATHBIO_NERCHackathonTwo_PublicTransport/blob/master/figs/emissions.png?raw=true)
*Emissions per person for several modes of transport. At least 20 passengers are needed on a train, and around 10 on a bus, to make it more efficient than each person taking their own large car.*

---
## Assumptions

- We assume that all people travelling are commuters and if they cannot travel by train then they will travel by car instead of finding another alternative method of transport.
- All commuters take separate cars to their destination, since, due to social distancing, they cannot share cars with other passengers.
- We assume trains are running at full capacity and therefore any unfilled seats on a bus or train correspond to a commuter who must drive to work
- We assume that passengers must be seated on the bus or train, and so are restricted to being in the seat locations.

---


## Team

The team is comprised of PhD Students from the mathematics department of Cardiff University. The project was conceived, developed, coded and written up by the group. The group received additional advice from their common supervisor, [Dr Thomas E. Woolley](https://www.cardiff.ac.uk/people/view/783107-woolley-thomas).

| <a href="https://github.com/Lucyhenley" target="_blank">**Lucy Henley, Project Lead**</a> | <a href="https://github.com/joshwillmoore1" target="_blank">**Joshua Moore**</a> | <a href="https://github.com/OstlerT" target="_blank">**Timothy Ostler**</a> |
| :---: |:---:| :---:|
| [![FVCproductions](https://avatars1.githubusercontent.com/Lucyhenley)](https://github.com/Lucyhenley)    | [![FVCproductions](https://avatars1.githubusercontent.com/joshwillmoore1)](https://github.com/joshwillmoore1) | [![FVCproductions](https://avatars1.githubusercontent.com/OstlerT)](https://github.com/OstlerT)  |
| <a href="https://github.com/Lucyhenley" target="_blank">`github.com/Lucyhenley`</a> | <a href="https://github.com/joshwillmoore1" target="_blank">`github.com/joshwillmoore1`</a> | <a href="https://github.com/OstlerT" target="_blank">`github.com/OstlerT`</a> |



[![License](http://img.shields.io/:license-mit-blue.svg?style=flat-square)](http://badges.mit-license.org)

- **[MIT license](http://opensource.org/licenses/mit-license.php)**
- Copyright 2015 © <a href="http://fvcproductions.com" target="_blank">FVCproductions</a>.
