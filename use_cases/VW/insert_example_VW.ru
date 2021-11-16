# Small example of alignment and instantiation of the MAS4AI meta model for the Volkswagen use case

BASE <http://mas4ai.eu/id/vw/>
PREFIX mas4ai: <http://example.org/MAS4AI_GenericModel#>
PREFIX vw: <http://mas4ai.eu/def/vw/>

INSERT DATA {

# Asset
vw:UBStation rdfs:subClassOf mas4ai:Resource . #L2 Under Body work station
<ubstation/UBStation1> a vw:UBStation .
vw:UBclip rdfs:subClassOf mas4ai:Resource . #L3 UB clip process
<ubclip/UBclip1> a vw:UBclip . #instance: need to check whether there can be multiple instances of the same workstation and process

# Agent
vw:UBStationAgent rdfs:subClassOf mas4ai:ResourceAgent . #Under Body work station
<ubstationagent/UBStationAgent1> a vw:UBStationAgent .
vw:UBclipAgent rdfs:subClassOf mas4ai:ResourceAgent . #UB clip process
<ubclipagent/UBclipAgent1> a vw:UBclipAgent .

# Relation Agent and Asset
<ubstationagent/UBStationAgent1> mas4ai:controlsResource <ubstation/UBStation1> .
<ubclipagent/UBclipAgent1> mas4ai:controlsResource <ubclip/UBclip1> .

# TODO: Relation agent/asset and AAS

# Skill
<skill/AB_UB> a mas4ai:Skill .
<skill/Clip_4x1> a mas4ai:Skill .

# Skill implementation
<ubstationagent/UBStationAgent1> mas4ai:hasSkill <skill/AB_UB> . #Is there a need for a generic construct of an implementation of a skill by an Agent (or let the specific implementation details part of the AAS) --> Skill vs capability (AAS)
<ubclipagent/UBclipAgent1> mas4ai:hasSkill <skill/Clip_4x1> .

# Product
<product/AB> a mas4ai:ResourceResultingProduct . #L1 car (Automobile Blue)
<product/AB_UB> a mas4ai:ResourceResultingProduct . #L2 module (Automobile Blue - Underbody)
<product/AB_UB_UBVLA> a mas4ai:ResourceResultingProduct . #L3 part (Automobile Blue - Underbody Reinforcement left outside)

# Product hierarchy #how to define hierarchical relation?
<product/AB_UB> vw:hasParent <product/AB> .
<product/AB_UB_UBVLA> vw:hasParent <product/AB_UB> .

# Task
<task/AB> a mas4ai:Task . #L1 #Job vs Task vs Order?
<task/AB_UB> a mas4ai:Task . #L2
<task/AB_UB_UBVLA> a mas4ai:Task ; #L3 #how to define hierarchical relation?
                      rdfs:label "Task_AB_UB_UBVLA" .

# Task predecessor relation # define those dependencies at Product or Task level?
<task/AB_EN> vw:hasPredecessor <task/AB_UB> . # Under body before Engine

# Relation Task and Product
<task/AB> mas4ai:resultsInProduct <product/AB> .
<task/AB_UB> mas4ai:resultsInProduct <product/AB_UB> .
<task/AB_UB_UBVLA> mas4ai:resultsInProduct <product/AB_UB_UBVLA> .

# Relation Task and Skill
<task/AB_UB> mas4ai:requiresSkill <skill/AB_UB> .
<task/AB_UB_UBVLA> mas4ai:requiresSkill <skill/Clip_4x1> .
}
