﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.42000
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------



[System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
[System.ServiceModel.ServiceContractAttribute(ConfigurationName="IStringCounter")]
public interface IStringCounter
{
    
    [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IStringCounter/GetCount", ReplyAction="http://tempuri.org/IStringCounter/GetCountResponse")]
    int GetCount(string search, string text);
    
    [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IStringCounter/GetCount", ReplyAction="http://tempuri.org/IStringCounter/GetCountResponse")]
    System.Threading.Tasks.Task<int> GetCountAsync(string search, string text);
}

[System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
public interface IStringCounterChannel : IStringCounter, System.ServiceModel.IClientChannel
{
}

[System.Diagnostics.DebuggerStepThroughAttribute()]
[System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
public partial class StringCounterClient : System.ServiceModel.ClientBase<IStringCounter>, IStringCounter
{
    
    public StringCounterClient()
    {
    }
    
    public StringCounterClient(string endpointConfigurationName) : 
            base(endpointConfigurationName)
    {
    }
    
    public StringCounterClient(string endpointConfigurationName, string remoteAddress) : 
            base(endpointConfigurationName, remoteAddress)
    {
    }
    
    public StringCounterClient(string endpointConfigurationName, System.ServiceModel.EndpointAddress remoteAddress) : 
            base(endpointConfigurationName, remoteAddress)
    {
    }
    
    public StringCounterClient(System.ServiceModel.Channels.Binding binding, System.ServiceModel.EndpointAddress remoteAddress) : 
            base(binding, remoteAddress)
    {
    }
    
    public int GetCount(string search, string text)
    {
        return base.Channel.GetCount(search, text);
    }
    
    public System.Threading.Tasks.Task<int> GetCountAsync(string search, string text)
    {
        return base.Channel.GetCountAsync(search, text);
    }
}
