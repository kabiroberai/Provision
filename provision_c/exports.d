module provision.provision_c.exports;

import provision.adi;
import provision.compat.general;
import std.string;

__gshared ADI gADI;

public extern(C) void provision_Load(const char* path) {
    gADI = new ADI(cast(string) path.fromStringz);
}

public extern(C) int provision_SetAndroidID(const char* identifier, uint length) {
    return androidInvoke!gADI.pADISetAndroidID(identifier, length);
}

public extern(C) int provision_SetProvisioningPath(const char* path) {
    return androidInvoke!gADI.pADISetProvisioningPath(path);
}

public extern(C) int provision_ProvisioningErase(ulong dsId) {
    return androidInvoke!gADI.pADIProvisioningErase(dsId);
}

public extern(C) int provision_Synchronize(ulong dsId, ubyte* serverIntermediateMetadata, uint serverIntermediateMetadataLength, ubyte** machineIdentifier, uint* machineIdentifierLength, ubyte** synchronizationResumeMetadata, uint* synchronizationResumeMetadataLength) {
    return androidInvoke!gADI.pADISynchronize(dsId, serverIntermediateMetadata, serverIntermediateMetadataLength, machineIdentifier, machineIdentifierLength, synchronizationResumeMetadata, synchronizationResumeMetadataLength);
}

public extern(C) int provision_ProvisioningDestroy(uint session) {
    return androidInvoke!gADI.pADIProvisioningDestroy(session);
}

public extern(C) int provision_ProvisioningEnd(uint session, ubyte* persistentTokenMetadata, uint persistentTokenMetadataLength, ubyte* trustKey, uint trustKeyLength) {
    return androidInvoke!gADI.pADIProvisioningEnd(session, persistentTokenMetadata, persistentTokenMetadataLength, trustKey, trustKeyLength);
}

public extern(C) int provision_ProvisioningStart(ulong dsId, ubyte* serverProvisioningIntermediateMetadata, uint serverProvisioningIntermediateMetadataLength, ubyte** clientProvisioningIntermediateMetadata, uint* clientProvisioningIntermediateMetadataLength, uint* session) {
    return androidInvoke!gADI.pADIProvisioningStart(dsId, serverProvisioningIntermediateMetadata, serverProvisioningIntermediateMetadataLength, clientProvisioningIntermediateMetadata, clientProvisioningIntermediateMetadataLength, session);
}

public extern(C) int provision_GetLoginCode(ulong dsId) {
    return androidInvoke!gADI.pADIGetLoginCode(dsId);
}

public extern(C) int provision_Dispose(void* ptr) {
    return androidInvoke!gADI.pADIDispose(ptr);
}

public extern(C) int provision_OTPRequest(ulong dsId, ubyte** machineIdentifier, uint* machineIdentifierLength, ubyte** oneTimePassword, uint* oneTimePasswordLength) {
    return androidInvoke!gADI.pADIOTPRequest(dsId, machineIdentifier, machineIdentifierLength, oneTimePassword, oneTimePasswordLength);
}
