# l3_agent.ini
[DEFAULT]
debug = {{.Values.debug}}

l3_agent_manager = neutron.agent.l3_agent.L3NATAgentWithStateReport
external_network_bridge =
gateway_external_network_id =
agent_mode = legacy
interface_driver = neutron.agent.linux.interface.OVSInterfaceDriver
ovs_use_veth = False

rpc_response_timeout = {{ .Values.rpc_response_timeout | default .Values.global.rpc_response_timeout | default 60 }}
rpc_workers = {{ .Values.rpc_workers | default .Values.global.rpc_workers | default 1 }}