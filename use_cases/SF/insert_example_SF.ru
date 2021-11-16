# Small example of alignment and instantiation of the MAS4AI meta model for the Smart Factory demonstrator

BASE <http://mas4ai.eu/id/sf/>
PREFIX mas4ai: <http://example.org/MAS4AI_GenericModel#>
PREFIX sf: <http://mas4ai.eu/def/sf/>

INSERT DATA {

# Asset
<asset/Shuttle> a mas4ai:Asset .
<asset/ProductionModule1> a mas4ai:Asset .

# Agent
sf:TransportAgent rdfs:subClassOf mas4ai:ResourceAgent .
<transportagent/ShuttleAgent> a sf:TransportAgent .
sf:ProductionModuleAgent rdfs:subClassOf mas4ai:ResourceAgent .
<productionmoduleagent/ProductionModuleAgent1> a sf:ModuleAgent .

# Relation Agent and Asset
<transportagent/ShuttleAgent> mas4ai:controlsResource <asset/Shuttle> .
<productionmoduleagent/ProductionModuleAgent1> mas4ai:controlsResource <asset/ProductionModule1> .

# TODO: Relation agent/asset and AAS

# Skill
<skill/Transport> a mas4ai:Skill .

# Skill implementation
<transportagent/ShuttleAgent> mas4ai:hasSkill <skill/Transport> . #Is there a need for a generic construct of an implementation of a skill by an Agent (or let the specific implementation details part of the AAS) --> Skill vs capability (AAS)

# Product

# Task
<task/Transport> a mas4ai:Task .

# Relation Task and Product

# Relation Task and Skill
<task/Transport> mas4ai:requiresSkill <skill/Transport> .
}
