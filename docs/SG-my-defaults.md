# My Default Security Groups

I've defined these Security Groups for my use, and you might find them useful as well.

## Allow Home

This Security Group allows unfettered access to instances with this SG from my home ip address.

Update ### - with your information.

```yaml
- Description: allow home connections
  GroupName: allow_home
  IpPermissions:
  - IpProtocol: '-1'
    IpRanges:
    - CidrIp: ###.###.###.###/32
    Ipv6Ranges: []
    PrefixListIds: []
    UserIdGroupPairs: []
  IpPermissionsEgress:
  - IpProtocol: '-1'
    IpRanges:
    - CidrIp: 0.0.0.0/0
    Ipv6Ranges: []
    PrefixListIds: []
    UserIdGroupPairs: []
  Tags:
  - Key: Name
    Value: allow_home
  VpcId: vpc-########
```

## VPC Access

This Security Group allows unfettered access to instances from the VPC to any instance also on the same VPC.

Update ### - with your information.

```yaml
- Description: access vpc 172.###.0.0/16
  GroupName: vpc access
  IpPermissions:
  - IpProtocol: '-1'
    IpRanges:
    - CidrIp: 172.###.0.0/16
      Description: internal vpc
    Ipv6Ranges: []
    PrefixListIds: []
    UserIdGroupPairs: []
  IpPermissionsEgress:
  - IpProtocol: '-1'
    IpRanges:
    - CidrIp: 0.0.0.0/0
    Ipv6Ranges: []
    PrefixListIds: []
    UserIdGroupPairs: []
  Tags:
  - Key: Name
    Value: vpc
  VpcId: vpc-########
```
