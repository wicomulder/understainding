# Small example of alignment, specialization, and instantiation of the MAS4AI meta model for the Smart Factory (Kaiserslautern) demonstrator

BASE <http://mas4ai.eu/id/sfkl/>
PREFIX mas4ai: <http://example.org/MAS4AI_GenericModel#>
PREFIX sfkl: <http://mas4ai.eu/def/sfkl/>

INSERT DATA {

# Resources (assets)
sfkl:Shuttle rdfs:subClassOf mas4ai:Resource .
sfkl:Module rdfs:subClassOf mas4ai:Resource .
sfkl:QS rdfs:subClassOf sfkl:QS .
sfkl:Worker rdfs:subClassOf mas4ai:Resource .
<resource/Shuttle1> a sfkl:Shuttle .
<resource/QS1> a sfkl:QS .
<resource/Worker1> a sfkl:Worker .

# Agent
sfkl:TransportAgent rdfs:subClassOf mas4ai:ResourceAgent .
sfkl:ModuleAgent rdfs:subClassOf mas4ai:ResourceAgent .
sfkl:HumanAgent rdfs:subClassOf mas4ai:MAS4AI_HMIHMCAgent .
<transportagent/ShuttleAgent1> a sf:TransportAgent .
<moduleagent/QSAgent1> a sf:ModuleAgent .
<humanagent/WorkerAgent1> a sf:HMIAgent .

# Relation Agent and Asset
<transportagent/ShuttleAgent1> mas4ai:controlsResource <resource/Shuttle1> .
<moduleagent/ModuleAgent1> mas4ai:controlsResource <resource/QS1> .
<hmiagent/WorkerAgent1> mas4ai:controlsResource <resource/Worker1> .

# TODO: Relation agent/asset and AAS

# Skill
<skill/Transport> a mas4ai:Skill .

# Skill implementation #on ontology or instance level?
<transportagent/ShuttleAgent1> mas4ai:hasSkill <skill/Transport> . #Is there a need for a generic construct of an implementation of a skill by an Agent (or let the specific implementation details part of the AAS) --> Skill vs capability (AAS)
<humanagent/WorkerAgent1> mas4ai:hasSkill <skill/Transport> .

# Product

# Task
<task/Transport> a mas4ai:Task .

# Relation Task and Product

# Relation Task and Skill
<task/Transport> mas4ai:requiresSkill <skill/Transport> .
}