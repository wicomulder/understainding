PREFIX mas4ai: <http://example.org/MAS4AI_GenericModel#>
PREFIX vw: <http://mas4ai.eu/def/vw/>
PREFIX vwid: <http://mas4ai.eu/id/vw/>

INSERT DATA
{

# Asset
vw:UBStation rdfs:subClassOf mas4ai:Resource . #L2 Under Body work station
vwid:UBStation1 a vw:UBStation .
vw:UBclip rdfs:subClassOf mas4ai:Resource . #L3 UB clip process
vwid:UBclip1 a vw:UBclip . #instance: need to check whether there can be multiple instances of the same workstation and process

# Agent
vw:UBStationAgent rdfs:subClassOf mas4ai:ResourceAgent . #Under Body work station
vwid:UBStationAgent1 a vw:UBStationAgent .
vw:UBclipAgent rdfs:subClassOf mas4ai:ResourceAgent . #UB clip process
vwid:UBclipAgent1 a vw:UBclipAgent .

# Relation Agent and Asset
vwid:UBStationAgent1 mas4ai:controlsResource vwid:UBStation1 . #No generic relation between Agent and Asset defined yet
vwid:UBclipAgent1 mas4ai:controlsResource vwid:UBclip1 .

# Skill
vwid:AB_UB a mas4ai:Skill .
vwid:Clip_4x1 a mas4ai:Skill .

# Skill implementation
vwid:UBStationAgent1 mas4ai:hasSkill vwid:AB_UB . #Is there a need for a generic construct of an implementation of a skill by an Agent (or let the specific implementation details part of the AAS) --> Skill vs capability (AAS)
vwid:UBclipAgent1 mas4ai:hasSkill vwid:Clip_4x1 .

# Product
vwid:AB a mas4ai:ResourceResultingProduct . #L1 car
vwid:AB_UB a mas4ai:ResourceResultingProduct . #L2 module
vwid:AB_UB_UBVLA a mas4ai:ResourceResultingProduct . #L3 process #how to define hierarchical relation?

# Task
vwid:Task_AB a mas4ai:Task . #L1 Job vs Task vs Order
vwid:Task_AB_UB a mas4ai:Task . #L2
vwid:Task_AB_UB_UBVLA a mas4ai:Task ; #L3 #how to define hierarchical relation?
                      rdfs:label "Task_AB_UB_UBVLA" .

# Relation Task and Product
vwid:Task_AB mas4ai:resultsInProduct vwid:AB .
vwid:Task_AB_UB mas4ai:resultsInProduct vwid:AB_UB .
vwid:Task_AB_UB_UBVLA mas4ai:resultsInProduct vwid:AB_UB_UBVLA .

# Relation Task and Skill
vwid:Task_AB_UB mas4ai:requiresSkill vwid:AB_UB .
vwid:Task_AB_UB_UBVLA mas4ai:requiresSkill vwid:Clip_4x1 .
}
