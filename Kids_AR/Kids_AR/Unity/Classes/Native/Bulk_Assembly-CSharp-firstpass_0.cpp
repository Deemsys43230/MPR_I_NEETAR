#include "il2cpp-config.h"

#ifndef _MSC_VER
# include <alloca.h>
#else
# include <malloc.h>
#endif


#include <cstring>
#include <string.h>
#include <stdio.h>
#include <cmath>
#include <limits>
#include <assert.h>
#include <stdint.h>

#include "il2cpp-class-internals.h"
#include "codegen/il2cpp-codegen.h"
#include "il2cpp-object-internals.h"

template <typename T1>
struct VirtActionInvoker1
{
	typedef void (*Action)(void*, T1, const RuntimeMethod*);

	static inline void Invoke (Il2CppMethodSlot slot, RuntimeObject* obj, T1 p1)
	{
		const VirtualInvokeData& invokeData = il2cpp_codegen_get_virtual_invoke_data(slot, obj);
		((Action)invokeData.methodPtr)(obj, p1, invokeData.method);
	}
};
struct VirtActionInvoker0
{
	typedef void (*Action)(void*, const RuntimeMethod*);

	static inline void Invoke (Il2CppMethodSlot slot, RuntimeObject* obj)
	{
		const VirtualInvokeData& invokeData = il2cpp_codegen_get_virtual_invoke_data(slot, obj);
		((Action)invokeData.methodPtr)(obj, invokeData.method);
	}
};
template <typename T1>
struct GenericVirtActionInvoker1
{
	typedef void (*Action)(void*, T1, const RuntimeMethod*);

	static inline void Invoke (const RuntimeMethod* method, RuntimeObject* obj, T1 p1)
	{
		VirtualInvokeData invokeData;
		il2cpp_codegen_get_generic_virtual_invoke_data(method, obj, &invokeData);
		((Action)invokeData.methodPtr)(obj, p1, invokeData.method);
	}
};
struct GenericVirtActionInvoker0
{
	typedef void (*Action)(void*, const RuntimeMethod*);

	static inline void Invoke (const RuntimeMethod* method, RuntimeObject* obj)
	{
		VirtualInvokeData invokeData;
		il2cpp_codegen_get_generic_virtual_invoke_data(method, obj, &invokeData);
		((Action)invokeData.methodPtr)(obj, invokeData.method);
	}
};
template <typename T1>
struct InterfaceActionInvoker1
{
	typedef void (*Action)(void*, T1, const RuntimeMethod*);

	static inline void Invoke (Il2CppMethodSlot slot, RuntimeClass* declaringInterface, RuntimeObject* obj, T1 p1)
	{
		const VirtualInvokeData& invokeData = il2cpp_codegen_get_interface_invoke_data(slot, obj, declaringInterface);
		((Action)invokeData.methodPtr)(obj, p1, invokeData.method);
	}
};
struct InterfaceActionInvoker0
{
	typedef void (*Action)(void*, const RuntimeMethod*);

	static inline void Invoke (Il2CppMethodSlot slot, RuntimeClass* declaringInterface, RuntimeObject* obj)
	{
		const VirtualInvokeData& invokeData = il2cpp_codegen_get_interface_invoke_data(slot, obj, declaringInterface);
		((Action)invokeData.methodPtr)(obj, invokeData.method);
	}
};
template <typename T1>
struct GenericInterfaceActionInvoker1
{
	typedef void (*Action)(void*, T1, const RuntimeMethod*);

	static inline void Invoke (const RuntimeMethod* method, RuntimeObject* obj, T1 p1)
	{
		VirtualInvokeData invokeData;
		il2cpp_codegen_get_generic_interface_invoke_data(method, obj, &invokeData);
		((Action)invokeData.methodPtr)(obj, p1, invokeData.method);
	}
};
struct GenericInterfaceActionInvoker0
{
	typedef void (*Action)(void*, const RuntimeMethod*);

	static inline void Invoke (const RuntimeMethod* method, RuntimeObject* obj)
	{
		VirtualInvokeData invokeData;
		il2cpp_codegen_get_generic_interface_invoke_data(method, obj, &invokeData);
		((Action)invokeData.methodPtr)(obj, invokeData.method);
	}
};

// System.String
struct String_t;
// System.IO.DirectoryInfo
struct DirectoryInfo_t35957480;
// System.Byte[]
struct ByteU5BU5D_t4116647657;
// NativeGallery/MediaSaveCallback
struct MediaSaveCallback_t1711154875;
// UnityEngine.Texture2D
struct Texture2D_t3840446185;
// UnityEngine.Object
struct Object_t631007953;
// System.ArgumentException
struct ArgumentException_t132251570;
// NativeGallery/MediaPickCallback
struct MediaPickCallback_t2468098299;
// NativeGallery/MediaPickMultipleCallback
struct MediaPickMultipleCallback_t2483155519;
// System.IO.FileNotFoundException
struct FileNotFoundException_t225391025;
// System.String[]
struct StringU5BU5D_t1281789340;
// System.Exception
struct Exception_t;
// System.Char[]
struct CharU5BU5D_t3528271667;
// System.IAsyncResult
struct IAsyncResult_t767004451;
// System.AsyncCallback
struct AsyncCallback_t3962456242;
// NativeGalleryNamespace.NGMediaReceiveCallbackiOS
struct NGMediaReceiveCallbackiOS_t840779778;
// UnityEngine.MonoBehaviour
struct MonoBehaviour_t3962482529;
// UnityEngine.GameObject
struct GameObject_t1113636619;
// UnityEngine.Component
struct Component_t1923634451;
// NativeGalleryNamespace.NGMediaSaveCallbackiOS
struct NGMediaSaveCallbackiOS_t2373647639;
// System.Runtime.Remoting.ServerIdentity
struct ServerIdentity_t2342208608;
// System.IntPtr[]
struct IntPtrU5BU5D_t4013366056;
// System.Collections.IDictionary
struct IDictionary_t1363984059;
// System.Void
struct Void_t1185182177;
// System.Byte
struct Byte_t1134296376;
// System.Double
struct Double_t594665363;
// System.UInt16
struct UInt16_t2177724958;
// System.Reflection.MethodInfo
struct MethodInfo_t;
// System.DelegateData
struct DelegateData_t1677132599;

extern RuntimeClass* NativeGallery_t2808515514_il2cpp_TypeInfo_var;
extern RuntimeClass* Path_t1605229823_il2cpp_TypeInfo_var;
extern String_t* _stringLiteral1392880498;
extern const uint32_t NativeGallery_get_TemporaryImagePath_m1358311393_MetadataUsageId;
extern String_t* _stringLiteral2649333259;
extern const uint32_t NativeGallery_get_IOSSelectedImagePath_m2691245459_MetadataUsageId;
extern const uint32_t NativeGallery_CheckPermission_m1786438771_MetadataUsageId;
extern const uint32_t NativeGallery_RequestPermission_m3085250992_MetadataUsageId;
extern const uint32_t NativeGallery_CanOpenSettings_m2865431573_MetadataUsageId;
extern const uint32_t NativeGallery_OpenSettings_m2073715281_MetadataUsageId;
extern const uint32_t NativeGallery_SaveImageToGallery_m3348418455_MetadataUsageId;
extern const uint32_t NativeGallery_SaveImageToGallery_m2353988206_MetadataUsageId;
extern RuntimeClass* Object_t631007953_il2cpp_TypeInfo_var;
extern RuntimeClass* ArgumentException_t132251570_il2cpp_TypeInfo_var;
extern RuntimeClass* String_t_il2cpp_TypeInfo_var;
extern const RuntimeMethod* NativeGallery_SaveImageToGallery_m1342837694_RuntimeMethod_var;
extern String_t* _stringLiteral563961164;
extern String_t* _stringLiteral2063196619;
extern String_t* _stringLiteral2860068956;
extern String_t* _stringLiteral2410385622;
extern const uint32_t NativeGallery_SaveImageToGallery_m1342837694_MetadataUsageId;
extern const uint32_t NativeGallery_SaveVideoToGallery_m3473076284_MetadataUsageId;
extern const uint32_t NativeGallery_SaveVideoToGallery_m2509233189_MetadataUsageId;
extern const uint32_t NativeGallery_GetImageFromGallery_m775556130_MetadataUsageId;
extern const uint32_t NativeGallery_GetVideoFromGallery_m3000217725_MetadataUsageId;
extern const uint32_t NativeGallery_GetImagesFromGallery_m3043034140_MetadataUsageId;
extern const uint32_t NativeGallery_GetVideosFromGallery_m134385912_MetadataUsageId;
extern const RuntimeMethod* NativeGallery_SaveToGallery_m3366416885_RuntimeMethod_var;
extern String_t* _stringLiteral1212739322;
extern String_t* _stringLiteral2755812117;
extern String_t* _stringLiteral1041934514;
extern const uint32_t NativeGallery_SaveToGallery_m3366416885_MetadataUsageId;
extern RuntimeClass* FileNotFoundException_t225391025_il2cpp_TypeInfo_var;
extern const RuntimeMethod* NativeGallery_SaveToGallery_m4000209401_RuntimeMethod_var;
extern String_t* _stringLiteral1685319404;
extern const uint32_t NativeGallery_SaveToGallery_m4000209401_MetadataUsageId;
extern RuntimeClass* Debug_t3317548046_il2cpp_TypeInfo_var;
extern String_t* _stringLiteral2894507939;
extern const uint32_t NativeGallery_SaveToGalleryInternal_m2106641_MetadataUsageId;
extern RuntimeClass* Int32_t2950945753_il2cpp_TypeInfo_var;
extern String_t* _stringLiteral628085470;
extern String_t* _stringLiteral2091341594;
extern const uint32_t NativeGallery_GetSavePath_m938747003_MetadataUsageId;
extern const uint32_t NativeGallery_GetMediaFromGallery_m2807044920_MetadataUsageId;
extern const uint32_t NativeGallery_GetMultipleMediaFromGallery_m1977049241_MetadataUsageId;
extern RuntimeClass* Texture2D_t3840446185_il2cpp_TypeInfo_var;
extern RuntimeClass* Exception_t_il2cpp_TypeInfo_var;
extern RuntimeClass* RuntimeObject_il2cpp_TypeInfo_var;
extern const RuntimeMethod* NativeGallery_LoadImageAtPath_m3208821149_RuntimeMethod_var;
extern String_t* _stringLiteral1045150428;
extern const uint32_t NativeGallery_LoadImageAtPath_m3208821149_MetadataUsageId;
extern RuntimeClass* CharU5BU5D_t3528271667_il2cpp_TypeInfo_var;
extern const RuntimeMethod* NativeGallery_GetImageProperties_m3966117691_RuntimeMethod_var;
extern String_t* _stringLiteral2045074213;
extern String_t* _stringLiteral1377815833;
extern String_t* _stringLiteral3988015567;
extern String_t* _stringLiteral2869855759;
extern String_t* _stringLiteral1929714747;
extern String_t* _stringLiteral2508466260;
extern const uint32_t NativeGallery_GetImageProperties_m3966117691_MetadataUsageId;
extern RuntimeClass* NGMediaReceiveCallbackiOS_t840779778_il2cpp_TypeInfo_var;
extern const uint32_t NGMediaReceiveCallbackiOS_get_IsBusy_m4210058844_MetadataUsageId;
extern const uint32_t NGMediaReceiveCallbackiOS_set_IsBusy_m2666300196_MetadataUsageId;
extern RuntimeClass* GameObject_t1113636619_il2cpp_TypeInfo_var;
extern const RuntimeMethod* GameObject_AddComponent_TisNGMediaReceiveCallbackiOS_t840779778_m935052088_RuntimeMethod_var;
extern String_t* _stringLiteral2435805968;
extern const uint32_t NGMediaReceiveCallbackiOS_Initialize_m2371316744_MetadataUsageId;
extern const uint32_t NGMediaReceiveCallbackiOS_OnMediaReceived_m4220214762_MetadataUsageId;
extern RuntimeClass* NGMediaSaveCallbackiOS_t2373647639_il2cpp_TypeInfo_var;
extern const RuntimeMethod* GameObject_AddComponent_TisNGMediaSaveCallbackiOS_t2373647639_m1416436511_RuntimeMethod_var;
extern String_t* _stringLiteral403054727;
extern const uint32_t NGMediaSaveCallbackiOS_Initialize_m3647472094_MetadataUsageId;
extern String_t* _stringLiteral1471173669;
extern const uint32_t NGMediaSaveCallbackiOS_OnMediaSaveFailed_m3052083401_MetadataUsageId;

struct ByteU5BU5D_t4116647657;
struct StringU5BU5D_t1281789340;
struct CharU5BU5D_t3528271667;


#ifndef U3CMODULEU3E_T692745548_H
#define U3CMODULEU3E_T692745548_H
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif

// <Module>
struct  U3CModuleU3E_t692745548 
{
public:

public:
};

#ifdef __clang__
#pragma clang diagnostic pop
#endif
#endif // U3CMODULEU3E_T692745548_H
#ifndef RUNTIMEOBJECT_H
#define RUNTIMEOBJECT_H
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif

// System.Object

#ifdef __clang__
#pragma clang diagnostic pop
#endif
#endif // RUNTIMEOBJECT_H
struct Il2CppArrayBounds;
#ifndef RUNTIMEARRAY_H
#define RUNTIMEARRAY_H
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif

// System.Array

#ifdef __clang__
#pragma clang diagnostic pop
#endif
#endif // RUNTIMEARRAY_H
#ifndef VALUETYPE_T3640485471_H
#define VALUETYPE_T3640485471_H
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif

// System.ValueType
struct  ValueType_t3640485471  : public RuntimeObject
{
public:

public:
};

#ifdef __clang__
#pragma clang diagnostic pop
#endif
// Native definition for P/Invoke marshalling of System.ValueType
struct ValueType_t3640485471_marshaled_pinvoke
{
};
// Native definition for COM marshalling of System.ValueType
struct ValueType_t3640485471_marshaled_com
{
};
#endif // VALUETYPE_T3640485471_H
#ifndef MARSHALBYREFOBJECT_T2760389100_H
#define MARSHALBYREFOBJECT_T2760389100_H
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif

// System.MarshalByRefObject
struct  MarshalByRefObject_t2760389100  : public RuntimeObject
{
public:
	// System.Runtime.Remoting.ServerIdentity System.MarshalByRefObject::_identity
	ServerIdentity_t2342208608 * ____identity_0;

public:
	inline static int32_t get_offset_of__identity_0() { return static_cast<int32_t>(offsetof(MarshalByRefObject_t2760389100, ____identity_0)); }
	inline ServerIdentity_t2342208608 * get__identity_0() const { return ____identity_0; }
	inline ServerIdentity_t2342208608 ** get_address_of__identity_0() { return &____identity_0; }
	inline void set__identity_0(ServerIdentity_t2342208608 * value)
	{
		____identity_0 = value;
		Il2CppCodeGenWriteBarrier((&____identity_0), value);
	}
};

#ifdef __clang__
#pragma clang diagnostic pop
#endif
#endif // MARSHALBYREFOBJECT_T2760389100_H
#ifndef EXCEPTION_T_H
#define EXCEPTION_T_H
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif

// System.Exception
struct  Exception_t  : public RuntimeObject
{
public:
	// System.IntPtr[] System.Exception::trace_ips
	IntPtrU5BU5D_t4013366056* ___trace_ips_0;
	// System.Exception System.Exception::inner_exception
	Exception_t * ___inner_exception_1;
	// System.String System.Exception::message
	String_t* ___message_2;
	// System.String System.Exception::help_link
	String_t* ___help_link_3;
	// System.String System.Exception::class_name
	String_t* ___class_name_4;
	// System.String System.Exception::stack_trace
	String_t* ___stack_trace_5;
	// System.String System.Exception::_remoteStackTraceString
	String_t* ____remoteStackTraceString_6;
	// System.Int32 System.Exception::remote_stack_index
	int32_t ___remote_stack_index_7;
	// System.Int32 System.Exception::hresult
	int32_t ___hresult_8;
	// System.String System.Exception::source
	String_t* ___source_9;
	// System.Collections.IDictionary System.Exception::_data
	RuntimeObject* ____data_10;

public:
	inline static int32_t get_offset_of_trace_ips_0() { return static_cast<int32_t>(offsetof(Exception_t, ___trace_ips_0)); }
	inline IntPtrU5BU5D_t4013366056* get_trace_ips_0() const { return ___trace_ips_0; }
	inline IntPtrU5BU5D_t4013366056** get_address_of_trace_ips_0() { return &___trace_ips_0; }
	inline void set_trace_ips_0(IntPtrU5BU5D_t4013366056* value)
	{
		___trace_ips_0 = value;
		Il2CppCodeGenWriteBarrier((&___trace_ips_0), value);
	}

	inline static int32_t get_offset_of_inner_exception_1() { return static_cast<int32_t>(offsetof(Exception_t, ___inner_exception_1)); }
	inline Exception_t * get_inner_exception_1() const { return ___inner_exception_1; }
	inline Exception_t ** get_address_of_inner_exception_1() { return &___inner_exception_1; }
	inline void set_inner_exception_1(Exception_t * value)
	{
		___inner_exception_1 = value;
		Il2CppCodeGenWriteBarrier((&___inner_exception_1), value);
	}

	inline static int32_t get_offset_of_message_2() { return static_cast<int32_t>(offsetof(Exception_t, ___message_2)); }
	inline String_t* get_message_2() const { return ___message_2; }
	inline String_t** get_address_of_message_2() { return &___message_2; }
	inline void set_message_2(String_t* value)
	{
		___message_2 = value;
		Il2CppCodeGenWriteBarrier((&___message_2), value);
	}

	inline static int32_t get_offset_of_help_link_3() { return static_cast<int32_t>(offsetof(Exception_t, ___help_link_3)); }
	inline String_t* get_help_link_3() const { return ___help_link_3; }
	inline String_t** get_address_of_help_link_3() { return &___help_link_3; }
	inline void set_help_link_3(String_t* value)
	{
		___help_link_3 = value;
		Il2CppCodeGenWriteBarrier((&___help_link_3), value);
	}

	inline static int32_t get_offset_of_class_name_4() { return static_cast<int32_t>(offsetof(Exception_t, ___class_name_4)); }
	inline String_t* get_class_name_4() const { return ___class_name_4; }
	inline String_t** get_address_of_class_name_4() { return &___class_name_4; }
	inline void set_class_name_4(String_t* value)
	{
		___class_name_4 = value;
		Il2CppCodeGenWriteBarrier((&___class_name_4), value);
	}

	inline static int32_t get_offset_of_stack_trace_5() { return static_cast<int32_t>(offsetof(Exception_t, ___stack_trace_5)); }
	inline String_t* get_stack_trace_5() const { return ___stack_trace_5; }
	inline String_t** get_address_of_stack_trace_5() { return &___stack_trace_5; }
	inline void set_stack_trace_5(String_t* value)
	{
		___stack_trace_5 = value;
		Il2CppCodeGenWriteBarrier((&___stack_trace_5), value);
	}

	inline static int32_t get_offset_of__remoteStackTraceString_6() { return static_cast<int32_t>(offsetof(Exception_t, ____remoteStackTraceString_6)); }
	inline String_t* get__remoteStackTraceString_6() const { return ____remoteStackTraceString_6; }
	inline String_t** get_address_of__remoteStackTraceString_6() { return &____remoteStackTraceString_6; }
	inline void set__remoteStackTraceString_6(String_t* value)
	{
		____remoteStackTraceString_6 = value;
		Il2CppCodeGenWriteBarrier((&____remoteStackTraceString_6), value);
	}

	inline static int32_t get_offset_of_remote_stack_index_7() { return static_cast<int32_t>(offsetof(Exception_t, ___remote_stack_index_7)); }
	inline int32_t get_remote_stack_index_7() const { return ___remote_stack_index_7; }
	inline int32_t* get_address_of_remote_stack_index_7() { return &___remote_stack_index_7; }
	inline void set_remote_stack_index_7(int32_t value)
	{
		___remote_stack_index_7 = value;
	}

	inline static int32_t get_offset_of_hresult_8() { return static_cast<int32_t>(offsetof(Exception_t, ___hresult_8)); }
	inline int32_t get_hresult_8() const { return ___hresult_8; }
	inline int32_t* get_address_of_hresult_8() { return &___hresult_8; }
	inline void set_hresult_8(int32_t value)
	{
		___hresult_8 = value;
	}

	inline static int32_t get_offset_of_source_9() { return static_cast<int32_t>(offsetof(Exception_t, ___source_9)); }
	inline String_t* get_source_9() const { return ___source_9; }
	inline String_t** get_address_of_source_9() { return &___source_9; }
	inline void set_source_9(String_t* value)
	{
		___source_9 = value;
		Il2CppCodeGenWriteBarrier((&___source_9), value);
	}

	inline static int32_t get_offset_of__data_10() { return static_cast<int32_t>(offsetof(Exception_t, ____data_10)); }
	inline RuntimeObject* get__data_10() const { return ____data_10; }
	inline RuntimeObject** get_address_of__data_10() { return &____data_10; }
	inline void set__data_10(RuntimeObject* value)
	{
		____data_10 = value;
		Il2CppCodeGenWriteBarrier((&____data_10), value);
	}
};

#ifdef __clang__
#pragma clang diagnostic pop
#endif
#endif // EXCEPTION_T_H
#ifndef NATIVEGALLERY_T2808515514_H
#define NATIVEGALLERY_T2808515514_H
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif

// NativeGallery
struct  NativeGallery_t2808515514  : public RuntimeObject
{
public:

public:
};

struct NativeGallery_t2808515514_StaticFields
{
public:
	// System.String NativeGallery::m_temporaryImagePath
	String_t* ___m_temporaryImagePath_0;
	// System.String NativeGallery::m_iOSSelectedImagePath
	String_t* ___m_iOSSelectedImagePath_1;

public:
	inline static int32_t get_offset_of_m_temporaryImagePath_0() { return static_cast<int32_t>(offsetof(NativeGallery_t2808515514_StaticFields, ___m_temporaryImagePath_0)); }
	inline String_t* get_m_temporaryImagePath_0() const { return ___m_temporaryImagePath_0; }
	inline String_t** get_address_of_m_temporaryImagePath_0() { return &___m_temporaryImagePath_0; }
	inline void set_m_temporaryImagePath_0(String_t* value)
	{
		___m_temporaryImagePath_0 = value;
		Il2CppCodeGenWriteBarrier((&___m_temporaryImagePath_0), value);
	}

	inline static int32_t get_offset_of_m_iOSSelectedImagePath_1() { return static_cast<int32_t>(offsetof(NativeGallery_t2808515514_StaticFields, ___m_iOSSelectedImagePath_1)); }
	inline String_t* get_m_iOSSelectedImagePath_1() const { return ___m_iOSSelectedImagePath_1; }
	inline String_t** get_address_of_m_iOSSelectedImagePath_1() { return &___m_iOSSelectedImagePath_1; }
	inline void set_m_iOSSelectedImagePath_1(String_t* value)
	{
		___m_iOSSelectedImagePath_1 = value;
		Il2CppCodeGenWriteBarrier((&___m_iOSSelectedImagePath_1), value);
	}
};

#ifdef __clang__
#pragma clang diagnostic pop
#endif
#endif // NATIVEGALLERY_T2808515514_H
#ifndef STRING_T_H
#define STRING_T_H
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif

// System.String
struct  String_t  : public RuntimeObject
{
public:
	// System.Int32 System.String::length
	int32_t ___length_0;
	// System.Char System.String::start_char
	Il2CppChar ___start_char_1;

public:
	inline static int32_t get_offset_of_length_0() { return static_cast<int32_t>(offsetof(String_t, ___length_0)); }
	inline int32_t get_length_0() const { return ___length_0; }
	inline int32_t* get_address_of_length_0() { return &___length_0; }
	inline void set_length_0(int32_t value)
	{
		___length_0 = value;
	}

	inline static int32_t get_offset_of_start_char_1() { return static_cast<int32_t>(offsetof(String_t, ___start_char_1)); }
	inline Il2CppChar get_start_char_1() const { return ___start_char_1; }
	inline Il2CppChar* get_address_of_start_char_1() { return &___start_char_1; }
	inline void set_start_char_1(Il2CppChar value)
	{
		___start_char_1 = value;
	}
};

struct String_t_StaticFields
{
public:
	// System.String System.String::Empty
	String_t* ___Empty_2;
	// System.Char[] System.String::WhiteChars
	CharU5BU5D_t3528271667* ___WhiteChars_3;

public:
	inline static int32_t get_offset_of_Empty_2() { return static_cast<int32_t>(offsetof(String_t_StaticFields, ___Empty_2)); }
	inline String_t* get_Empty_2() const { return ___Empty_2; }
	inline String_t** get_address_of_Empty_2() { return &___Empty_2; }
	inline void set_Empty_2(String_t* value)
	{
		___Empty_2 = value;
		Il2CppCodeGenWriteBarrier((&___Empty_2), value);
	}

	inline static int32_t get_offset_of_WhiteChars_3() { return static_cast<int32_t>(offsetof(String_t_StaticFields, ___WhiteChars_3)); }
	inline CharU5BU5D_t3528271667* get_WhiteChars_3() const { return ___WhiteChars_3; }
	inline CharU5BU5D_t3528271667** get_address_of_WhiteChars_3() { return &___WhiteChars_3; }
	inline void set_WhiteChars_3(CharU5BU5D_t3528271667* value)
	{
		___WhiteChars_3 = value;
		Il2CppCodeGenWriteBarrier((&___WhiteChars_3), value);
	}
};

#ifdef __clang__
#pragma clang diagnostic pop
#endif
#endif // STRING_T_H
#ifndef VOID_T1185182177_H
#define VOID_T1185182177_H
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif

// System.Void
struct  Void_t1185182177 
{
public:

public:
};

#ifdef __clang__
#pragma clang diagnostic pop
#endif
#endif // VOID_T1185182177_H
#ifndef BOOLEAN_T97287965_H
#define BOOLEAN_T97287965_H
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif

// System.Boolean
struct  Boolean_t97287965 
{
public:
	// System.Boolean System.Boolean::m_value
	bool ___m_value_2;

public:
	inline static int32_t get_offset_of_m_value_2() { return static_cast<int32_t>(offsetof(Boolean_t97287965, ___m_value_2)); }
	inline bool get_m_value_2() const { return ___m_value_2; }
	inline bool* get_address_of_m_value_2() { return &___m_value_2; }
	inline void set_m_value_2(bool value)
	{
		___m_value_2 = value;
	}
};

struct Boolean_t97287965_StaticFields
{
public:
	// System.String System.Boolean::FalseString
	String_t* ___FalseString_0;
	// System.String System.Boolean::TrueString
	String_t* ___TrueString_1;

public:
	inline static int32_t get_offset_of_FalseString_0() { return static_cast<int32_t>(offsetof(Boolean_t97287965_StaticFields, ___FalseString_0)); }
	inline String_t* get_FalseString_0() const { return ___FalseString_0; }
	inline String_t** get_address_of_FalseString_0() { return &___FalseString_0; }
	inline void set_FalseString_0(String_t* value)
	{
		___FalseString_0 = value;
		Il2CppCodeGenWriteBarrier((&___FalseString_0), value);
	}

	inline static int32_t get_offset_of_TrueString_1() { return static_cast<int32_t>(offsetof(Boolean_t97287965_StaticFields, ___TrueString_1)); }
	inline String_t* get_TrueString_1() const { return ___TrueString_1; }
	inline String_t** get_address_of_TrueString_1() { return &___TrueString_1; }
	inline void set_TrueString_1(String_t* value)
	{
		___TrueString_1 = value;
		Il2CppCodeGenWriteBarrier((&___TrueString_1), value);
	}
};

#ifdef __clang__
#pragma clang diagnostic pop
#endif
#endif // BOOLEAN_T97287965_H
#ifndef INT32_T2950945753_H
#define INT32_T2950945753_H
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif

// System.Int32
struct  Int32_t2950945753 
{
public:
	// System.Int32 System.Int32::m_value
	int32_t ___m_value_2;

public:
	inline static int32_t get_offset_of_m_value_2() { return static_cast<int32_t>(offsetof(Int32_t2950945753, ___m_value_2)); }
	inline int32_t get_m_value_2() const { return ___m_value_2; }
	inline int32_t* get_address_of_m_value_2() { return &___m_value_2; }
	inline void set_m_value_2(int32_t value)
	{
		___m_value_2 = value;
	}
};

#ifdef __clang__
#pragma clang diagnostic pop
#endif
#endif // INT32_T2950945753_H
#ifndef BYTE_T1134296376_H
#define BYTE_T1134296376_H
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif

// System.Byte
struct  Byte_t1134296376 
{
public:
	// System.Byte System.Byte::m_value
	uint8_t ___m_value_2;

public:
	inline static int32_t get_offset_of_m_value_2() { return static_cast<int32_t>(offsetof(Byte_t1134296376, ___m_value_2)); }
	inline uint8_t get_m_value_2() const { return ___m_value_2; }
	inline uint8_t* get_address_of_m_value_2() { return &___m_value_2; }
	inline void set_m_value_2(uint8_t value)
	{
		___m_value_2 = value;
	}
};

#ifdef __clang__
#pragma clang diagnostic pop
#endif
#endif // BYTE_T1134296376_H
#ifndef ENUM_T4135868527_H
#define ENUM_T4135868527_H
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif

// System.Enum
struct  Enum_t4135868527  : public ValueType_t3640485471
{
public:

public:
};

struct Enum_t4135868527_StaticFields
{
public:
	// System.Char[] System.Enum::split_char
	CharU5BU5D_t3528271667* ___split_char_0;

public:
	inline static int32_t get_offset_of_split_char_0() { return static_cast<int32_t>(offsetof(Enum_t4135868527_StaticFields, ___split_char_0)); }
	inline CharU5BU5D_t3528271667* get_split_char_0() const { return ___split_char_0; }
	inline CharU5BU5D_t3528271667** get_address_of_split_char_0() { return &___split_char_0; }
	inline void set_split_char_0(CharU5BU5D_t3528271667* value)
	{
		___split_char_0 = value;
		Il2CppCodeGenWriteBarrier((&___split_char_0), value);
	}
};

#ifdef __clang__
#pragma clang diagnostic pop
#endif
// Native definition for P/Invoke marshalling of System.Enum
struct Enum_t4135868527_marshaled_pinvoke
{
};
// Native definition for COM marshalling of System.Enum
struct Enum_t4135868527_marshaled_com
{
};
#endif // ENUM_T4135868527_H
#ifndef SINGLE_T1397266774_H
#define SINGLE_T1397266774_H
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif

// System.Single
struct  Single_t1397266774 
{
public:
	// System.Single System.Single::m_value
	float ___m_value_7;

public:
	inline static int32_t get_offset_of_m_value_7() { return static_cast<int32_t>(offsetof(Single_t1397266774, ___m_value_7)); }
	inline float get_m_value_7() const { return ___m_value_7; }
	inline float* get_address_of_m_value_7() { return &___m_value_7; }
	inline void set_m_value_7(float value)
	{
		___m_value_7 = value;
	}
};

#ifdef __clang__
#pragma clang diagnostic pop
#endif
#endif // SINGLE_T1397266774_H
#ifndef INTPTR_T_H
#define INTPTR_T_H
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif

// System.IntPtr
struct  IntPtr_t 
{
public:
	// System.Void* System.IntPtr::m_value
	void* ___m_value_0;

public:
	inline static int32_t get_offset_of_m_value_0() { return static_cast<int32_t>(offsetof(IntPtr_t, ___m_value_0)); }
	inline void* get_m_value_0() const { return ___m_value_0; }
	inline void** get_address_of_m_value_0() { return &___m_value_0; }
	inline void set_m_value_0(void* value)
	{
		___m_value_0 = value;
	}
};

struct IntPtr_t_StaticFields
{
public:
	// System.IntPtr System.IntPtr::Zero
	intptr_t ___Zero_1;

public:
	inline static int32_t get_offset_of_Zero_1() { return static_cast<int32_t>(offsetof(IntPtr_t_StaticFields, ___Zero_1)); }
	inline intptr_t get_Zero_1() const { return ___Zero_1; }
	inline intptr_t* get_address_of_Zero_1() { return &___Zero_1; }
	inline void set_Zero_1(intptr_t value)
	{
		___Zero_1 = value;
	}
};

#ifdef __clang__
#pragma clang diagnostic pop
#endif
#endif // INTPTR_T_H
#ifndef CHAR_T3634460470_H
#define CHAR_T3634460470_H
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif

// System.Char
struct  Char_t3634460470 
{
public:
	// System.Char System.Char::m_value
	Il2CppChar ___m_value_2;

public:
	inline static int32_t get_offset_of_m_value_2() { return static_cast<int32_t>(offsetof(Char_t3634460470, ___m_value_2)); }
	inline Il2CppChar get_m_value_2() const { return ___m_value_2; }
	inline Il2CppChar* get_address_of_m_value_2() { return &___m_value_2; }
	inline void set_m_value_2(Il2CppChar value)
	{
		___m_value_2 = value;
	}
};

struct Char_t3634460470_StaticFields
{
public:
	// System.Byte* System.Char::category_data
	uint8_t* ___category_data_3;
	// System.Byte* System.Char::numeric_data
	uint8_t* ___numeric_data_4;
	// System.Double* System.Char::numeric_data_values
	double* ___numeric_data_values_5;
	// System.UInt16* System.Char::to_lower_data_low
	uint16_t* ___to_lower_data_low_6;
	// System.UInt16* System.Char::to_lower_data_high
	uint16_t* ___to_lower_data_high_7;
	// System.UInt16* System.Char::to_upper_data_low
	uint16_t* ___to_upper_data_low_8;
	// System.UInt16* System.Char::to_upper_data_high
	uint16_t* ___to_upper_data_high_9;

public:
	inline static int32_t get_offset_of_category_data_3() { return static_cast<int32_t>(offsetof(Char_t3634460470_StaticFields, ___category_data_3)); }
	inline uint8_t* get_category_data_3() const { return ___category_data_3; }
	inline uint8_t** get_address_of_category_data_3() { return &___category_data_3; }
	inline void set_category_data_3(uint8_t* value)
	{
		___category_data_3 = value;
	}

	inline static int32_t get_offset_of_numeric_data_4() { return static_cast<int32_t>(offsetof(Char_t3634460470_StaticFields, ___numeric_data_4)); }
	inline uint8_t* get_numeric_data_4() const { return ___numeric_data_4; }
	inline uint8_t** get_address_of_numeric_data_4() { return &___numeric_data_4; }
	inline void set_numeric_data_4(uint8_t* value)
	{
		___numeric_data_4 = value;
	}

	inline static int32_t get_offset_of_numeric_data_values_5() { return static_cast<int32_t>(offsetof(Char_t3634460470_StaticFields, ___numeric_data_values_5)); }
	inline double* get_numeric_data_values_5() const { return ___numeric_data_values_5; }
	inline double** get_address_of_numeric_data_values_5() { return &___numeric_data_values_5; }
	inline void set_numeric_data_values_5(double* value)
	{
		___numeric_data_values_5 = value;
	}

	inline static int32_t get_offset_of_to_lower_data_low_6() { return static_cast<int32_t>(offsetof(Char_t3634460470_StaticFields, ___to_lower_data_low_6)); }
	inline uint16_t* get_to_lower_data_low_6() const { return ___to_lower_data_low_6; }
	inline uint16_t** get_address_of_to_lower_data_low_6() { return &___to_lower_data_low_6; }
	inline void set_to_lower_data_low_6(uint16_t* value)
	{
		___to_lower_data_low_6 = value;
	}

	inline static int32_t get_offset_of_to_lower_data_high_7() { return static_cast<int32_t>(offsetof(Char_t3634460470_StaticFields, ___to_lower_data_high_7)); }
	inline uint16_t* get_to_lower_data_high_7() const { return ___to_lower_data_high_7; }
	inline uint16_t** get_address_of_to_lower_data_high_7() { return &___to_lower_data_high_7; }
	inline void set_to_lower_data_high_7(uint16_t* value)
	{
		___to_lower_data_high_7 = value;
	}

	inline static int32_t get_offset_of_to_upper_data_low_8() { return static_cast<int32_t>(offsetof(Char_t3634460470_StaticFields, ___to_upper_data_low_8)); }
	inline uint16_t* get_to_upper_data_low_8() const { return ___to_upper_data_low_8; }
	inline uint16_t** get_address_of_to_upper_data_low_8() { return &___to_upper_data_low_8; }
	inline void set_to_upper_data_low_8(uint16_t* value)
	{
		___to_upper_data_low_8 = value;
	}

	inline static int32_t get_offset_of_to_upper_data_high_9() { return static_cast<int32_t>(offsetof(Char_t3634460470_StaticFields, ___to_upper_data_high_9)); }
	inline uint16_t* get_to_upper_data_high_9() const { return ___to_upper_data_high_9; }
	inline uint16_t** get_address_of_to_upper_data_high_9() { return &___to_upper_data_high_9; }
	inline void set_to_upper_data_high_9(uint16_t* value)
	{
		___to_upper_data_high_9 = value;
	}
};

#ifdef __clang__
#pragma clang diagnostic pop
#endif
#endif // CHAR_T3634460470_H
#ifndef SYSTEMEXCEPTION_T176217640_H
#define SYSTEMEXCEPTION_T176217640_H
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif

// System.SystemException
struct  SystemException_t176217640  : public Exception_t
{
public:

public:
};

#ifdef __clang__
#pragma clang diagnostic pop
#endif
#endif // SYSTEMEXCEPTION_T176217640_H
#ifndef IOEXCEPTION_T4088381929_H
#define IOEXCEPTION_T4088381929_H
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif

// System.IO.IOException
struct  IOException_t4088381929  : public SystemException_t176217640
{
public:

public:
};

#ifdef __clang__
#pragma clang diagnostic pop
#endif
#endif // IOEXCEPTION_T4088381929_H
#ifndef DELEGATE_T1188392813_H
#define DELEGATE_T1188392813_H
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif

// System.Delegate
struct  Delegate_t1188392813  : public RuntimeObject
{
public:
	// System.IntPtr System.Delegate::method_ptr
	Il2CppMethodPointer ___method_ptr_0;
	// System.IntPtr System.Delegate::invoke_impl
	intptr_t ___invoke_impl_1;
	// System.Object System.Delegate::m_target
	RuntimeObject * ___m_target_2;
	// System.IntPtr System.Delegate::method
	intptr_t ___method_3;
	// System.IntPtr System.Delegate::delegate_trampoline
	intptr_t ___delegate_trampoline_4;
	// System.IntPtr System.Delegate::method_code
	intptr_t ___method_code_5;
	// System.Reflection.MethodInfo System.Delegate::method_info
	MethodInfo_t * ___method_info_6;
	// System.Reflection.MethodInfo System.Delegate::original_method_info
	MethodInfo_t * ___original_method_info_7;
	// System.DelegateData System.Delegate::data
	DelegateData_t1677132599 * ___data_8;

public:
	inline static int32_t get_offset_of_method_ptr_0() { return static_cast<int32_t>(offsetof(Delegate_t1188392813, ___method_ptr_0)); }
	inline Il2CppMethodPointer get_method_ptr_0() const { return ___method_ptr_0; }
	inline Il2CppMethodPointer* get_address_of_method_ptr_0() { return &___method_ptr_0; }
	inline void set_method_ptr_0(Il2CppMethodPointer value)
	{
		___method_ptr_0 = value;
	}

	inline static int32_t get_offset_of_invoke_impl_1() { return static_cast<int32_t>(offsetof(Delegate_t1188392813, ___invoke_impl_1)); }
	inline intptr_t get_invoke_impl_1() const { return ___invoke_impl_1; }
	inline intptr_t* get_address_of_invoke_impl_1() { return &___invoke_impl_1; }
	inline void set_invoke_impl_1(intptr_t value)
	{
		___invoke_impl_1 = value;
	}

	inline static int32_t get_offset_of_m_target_2() { return static_cast<int32_t>(offsetof(Delegate_t1188392813, ___m_target_2)); }
	inline RuntimeObject * get_m_target_2() const { return ___m_target_2; }
	inline RuntimeObject ** get_address_of_m_target_2() { return &___m_target_2; }
	inline void set_m_target_2(RuntimeObject * value)
	{
		___m_target_2 = value;
		Il2CppCodeGenWriteBarrier((&___m_target_2), value);
	}

	inline static int32_t get_offset_of_method_3() { return static_cast<int32_t>(offsetof(Delegate_t1188392813, ___method_3)); }
	inline intptr_t get_method_3() const { return ___method_3; }
	inline intptr_t* get_address_of_method_3() { return &___method_3; }
	inline void set_method_3(intptr_t value)
	{
		___method_3 = value;
	}

	inline static int32_t get_offset_of_delegate_trampoline_4() { return static_cast<int32_t>(offsetof(Delegate_t1188392813, ___delegate_trampoline_4)); }
	inline intptr_t get_delegate_trampoline_4() const { return ___delegate_trampoline_4; }
	inline intptr_t* get_address_of_delegate_trampoline_4() { return &___delegate_trampoline_4; }
	inline void set_delegate_trampoline_4(intptr_t value)
	{
		___delegate_trampoline_4 = value;
	}

	inline static int32_t get_offset_of_method_code_5() { return static_cast<int32_t>(offsetof(Delegate_t1188392813, ___method_code_5)); }
	inline intptr_t get_method_code_5() const { return ___method_code_5; }
	inline intptr_t* get_address_of_method_code_5() { return &___method_code_5; }
	inline void set_method_code_5(intptr_t value)
	{
		___method_code_5 = value;
	}

	inline static int32_t get_offset_of_method_info_6() { return static_cast<int32_t>(offsetof(Delegate_t1188392813, ___method_info_6)); }
	inline MethodInfo_t * get_method_info_6() const { return ___method_info_6; }
	inline MethodInfo_t ** get_address_of_method_info_6() { return &___method_info_6; }
	inline void set_method_info_6(MethodInfo_t * value)
	{
		___method_info_6 = value;
		Il2CppCodeGenWriteBarrier((&___method_info_6), value);
	}

	inline static int32_t get_offset_of_original_method_info_7() { return static_cast<int32_t>(offsetof(Delegate_t1188392813, ___original_method_info_7)); }
	inline MethodInfo_t * get_original_method_info_7() const { return ___original_method_info_7; }
	inline MethodInfo_t ** get_address_of_original_method_info_7() { return &___original_method_info_7; }
	inline void set_original_method_info_7(MethodInfo_t * value)
	{
		___original_method_info_7 = value;
		Il2CppCodeGenWriteBarrier((&___original_method_info_7), value);
	}

	inline static int32_t get_offset_of_data_8() { return static_cast<int32_t>(offsetof(Delegate_t1188392813, ___data_8)); }
	inline DelegateData_t1677132599 * get_data_8() const { return ___data_8; }
	inline DelegateData_t1677132599 ** get_address_of_data_8() { return &___data_8; }
	inline void set_data_8(DelegateData_t1677132599 * value)
	{
		___data_8 = value;
		Il2CppCodeGenWriteBarrier((&___data_8), value);
	}
};

#ifdef __clang__
#pragma clang diagnostic pop
#endif
#endif // DELEGATE_T1188392813_H
#ifndef IMAGEORIENTATION_T1544028654_H
#define IMAGEORIENTATION_T1544028654_H
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif

// NativeGallery/ImageOrientation
struct  ImageOrientation_t1544028654 
{
public:
	// System.Int32 NativeGallery/ImageOrientation::value__
	int32_t ___value___1;

public:
	inline static int32_t get_offset_of_value___1() { return static_cast<int32_t>(offsetof(ImageOrientation_t1544028654, ___value___1)); }
	inline int32_t get_value___1() const { return ___value___1; }
	inline int32_t* get_address_of_value___1() { return &___value___1; }
	inline void set_value___1(int32_t value)
	{
		___value___1 = value;
	}
};

#ifdef __clang__
#pragma clang diagnostic pop
#endif
#endif // IMAGEORIENTATION_T1544028654_H
#ifndef OBJECT_T631007953_H
#define OBJECT_T631007953_H
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif

// UnityEngine.Object
struct  Object_t631007953  : public RuntimeObject
{
public:
	// System.IntPtr UnityEngine.Object::m_CachedPtr
	intptr_t ___m_CachedPtr_0;

public:
	inline static int32_t get_offset_of_m_CachedPtr_0() { return static_cast<int32_t>(offsetof(Object_t631007953, ___m_CachedPtr_0)); }
	inline intptr_t get_m_CachedPtr_0() const { return ___m_CachedPtr_0; }
	inline intptr_t* get_address_of_m_CachedPtr_0() { return &___m_CachedPtr_0; }
	inline void set_m_CachedPtr_0(intptr_t value)
	{
		___m_CachedPtr_0 = value;
	}
};

struct Object_t631007953_StaticFields
{
public:
	// System.Int32 UnityEngine.Object::OffsetOfInstanceIDInCPlusPlusObject
	int32_t ___OffsetOfInstanceIDInCPlusPlusObject_1;

public:
	inline static int32_t get_offset_of_OffsetOfInstanceIDInCPlusPlusObject_1() { return static_cast<int32_t>(offsetof(Object_t631007953_StaticFields, ___OffsetOfInstanceIDInCPlusPlusObject_1)); }
	inline int32_t get_OffsetOfInstanceIDInCPlusPlusObject_1() const { return ___OffsetOfInstanceIDInCPlusPlusObject_1; }
	inline int32_t* get_address_of_OffsetOfInstanceIDInCPlusPlusObject_1() { return &___OffsetOfInstanceIDInCPlusPlusObject_1; }
	inline void set_OffsetOfInstanceIDInCPlusPlusObject_1(int32_t value)
	{
		___OffsetOfInstanceIDInCPlusPlusObject_1 = value;
	}
};

#ifdef __clang__
#pragma clang diagnostic pop
#endif
// Native definition for P/Invoke marshalling of UnityEngine.Object
struct Object_t631007953_marshaled_pinvoke
{
	intptr_t ___m_CachedPtr_0;
};
// Native definition for COM marshalling of UnityEngine.Object
struct Object_t631007953_marshaled_com
{
	intptr_t ___m_CachedPtr_0;
};
#endif // OBJECT_T631007953_H
#ifndef PERMISSION_T4107725739_H
#define PERMISSION_T4107725739_H
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif

// NativeGallery/Permission
struct  Permission_t4107725739 
{
public:
	// System.Int32 NativeGallery/Permission::value__
	int32_t ___value___1;

public:
	inline static int32_t get_offset_of_value___1() { return static_cast<int32_t>(offsetof(Permission_t4107725739, ___value___1)); }
	inline int32_t get_value___1() const { return ___value___1; }
	inline int32_t* get_address_of_value___1() { return &___value___1; }
	inline void set_value___1(int32_t value)
	{
		___value___1 = value;
	}
};

#ifdef __clang__
#pragma clang diagnostic pop
#endif
#endif // PERMISSION_T4107725739_H
#ifndef TEXTUREFORMAT_T2701165832_H
#define TEXTUREFORMAT_T2701165832_H
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif

// UnityEngine.TextureFormat
struct  TextureFormat_t2701165832 
{
public:
	// System.Int32 UnityEngine.TextureFormat::value__
	int32_t ___value___1;

public:
	inline static int32_t get_offset_of_value___1() { return static_cast<int32_t>(offsetof(TextureFormat_t2701165832, ___value___1)); }
	inline int32_t get_value___1() const { return ___value___1; }
	inline int32_t* get_address_of_value___1() { return &___value___1; }
	inline void set_value___1(int32_t value)
	{
		___value___1 = value;
	}
};

#ifdef __clang__
#pragma clang diagnostic pop
#endif
#endif // TEXTUREFORMAT_T2701165832_H
#ifndef ARGUMENTEXCEPTION_T132251570_H
#define ARGUMENTEXCEPTION_T132251570_H
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif

// System.ArgumentException
struct  ArgumentException_t132251570  : public SystemException_t176217640
{
public:
	// System.String System.ArgumentException::param_name
	String_t* ___param_name_12;

public:
	inline static int32_t get_offset_of_param_name_12() { return static_cast<int32_t>(offsetof(ArgumentException_t132251570, ___param_name_12)); }
	inline String_t* get_param_name_12() const { return ___param_name_12; }
	inline String_t** get_address_of_param_name_12() { return &___param_name_12; }
	inline void set_param_name_12(String_t* value)
	{
		___param_name_12 = value;
		Il2CppCodeGenWriteBarrier((&___param_name_12), value);
	}
};

#ifdef __clang__
#pragma clang diagnostic pop
#endif
#endif // ARGUMENTEXCEPTION_T132251570_H
#ifndef FILEATTRIBUTES_T3417205536_H
#define FILEATTRIBUTES_T3417205536_H
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif

// System.IO.FileAttributes
struct  FileAttributes_t3417205536 
{
public:
	// System.Int32 System.IO.FileAttributes::value__
	int32_t ___value___1;

public:
	inline static int32_t get_offset_of_value___1() { return static_cast<int32_t>(offsetof(FileAttributes_t3417205536, ___value___1)); }
	inline int32_t get_value___1() const { return ___value___1; }
	inline int32_t* get_address_of_value___1() { return &___value___1; }
	inline void set_value___1(int32_t value)
	{
		___value___1 = value;
	}
};

#ifdef __clang__
#pragma clang diagnostic pop
#endif
#endif // FILEATTRIBUTES_T3417205536_H
#ifndef IMAGEPROPERTIES_T914339828_H
#define IMAGEPROPERTIES_T914339828_H
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif

// NativeGallery/ImageProperties
struct  ImageProperties_t914339828 
{
public:
	// System.Int32 NativeGallery/ImageProperties::width
	int32_t ___width_0;
	// System.Int32 NativeGallery/ImageProperties::height
	int32_t ___height_1;
	// System.String NativeGallery/ImageProperties::mimeType
	String_t* ___mimeType_2;
	// NativeGallery/ImageOrientation NativeGallery/ImageProperties::orientation
	int32_t ___orientation_3;

public:
	inline static int32_t get_offset_of_width_0() { return static_cast<int32_t>(offsetof(ImageProperties_t914339828, ___width_0)); }
	inline int32_t get_width_0() const { return ___width_0; }
	inline int32_t* get_address_of_width_0() { return &___width_0; }
	inline void set_width_0(int32_t value)
	{
		___width_0 = value;
	}

	inline static int32_t get_offset_of_height_1() { return static_cast<int32_t>(offsetof(ImageProperties_t914339828, ___height_1)); }
	inline int32_t get_height_1() const { return ___height_1; }
	inline int32_t* get_address_of_height_1() { return &___height_1; }
	inline void set_height_1(int32_t value)
	{
		___height_1 = value;
	}

	inline static int32_t get_offset_of_mimeType_2() { return static_cast<int32_t>(offsetof(ImageProperties_t914339828, ___mimeType_2)); }
	inline String_t* get_mimeType_2() const { return ___mimeType_2; }
	inline String_t** get_address_of_mimeType_2() { return &___mimeType_2; }
	inline void set_mimeType_2(String_t* value)
	{
		___mimeType_2 = value;
		Il2CppCodeGenWriteBarrier((&___mimeType_2), value);
	}

	inline static int32_t get_offset_of_orientation_3() { return static_cast<int32_t>(offsetof(ImageProperties_t914339828, ___orientation_3)); }
	inline int32_t get_orientation_3() const { return ___orientation_3; }
	inline int32_t* get_address_of_orientation_3() { return &___orientation_3; }
	inline void set_orientation_3(int32_t value)
	{
		___orientation_3 = value;
	}
};

#ifdef __clang__
#pragma clang diagnostic pop
#endif
// Native definition for P/Invoke marshalling of NativeGallery/ImageProperties
struct ImageProperties_t914339828_marshaled_pinvoke
{
	int32_t ___width_0;
	int32_t ___height_1;
	char* ___mimeType_2;
	int32_t ___orientation_3;
};
// Native definition for COM marshalling of NativeGallery/ImageProperties
struct ImageProperties_t914339828_marshaled_com
{
	int32_t ___width_0;
	int32_t ___height_1;
	Il2CppChar* ___mimeType_2;
	int32_t ___orientation_3;
};
#endif // IMAGEPROPERTIES_T914339828_H
#ifndef MONOIOSTAT_T592533987_H
#define MONOIOSTAT_T592533987_H
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif

// System.IO.MonoIOStat
struct  MonoIOStat_t592533987 
{
public:
	// System.String System.IO.MonoIOStat::Name
	String_t* ___Name_0;
	// System.IO.FileAttributes System.IO.MonoIOStat::Attributes
	int32_t ___Attributes_1;
	// System.Int64 System.IO.MonoIOStat::Length
	int64_t ___Length_2;
	// System.Int64 System.IO.MonoIOStat::CreationTime
	int64_t ___CreationTime_3;
	// System.Int64 System.IO.MonoIOStat::LastAccessTime
	int64_t ___LastAccessTime_4;
	// System.Int64 System.IO.MonoIOStat::LastWriteTime
	int64_t ___LastWriteTime_5;

public:
	inline static int32_t get_offset_of_Name_0() { return static_cast<int32_t>(offsetof(MonoIOStat_t592533987, ___Name_0)); }
	inline String_t* get_Name_0() const { return ___Name_0; }
	inline String_t** get_address_of_Name_0() { return &___Name_0; }
	inline void set_Name_0(String_t* value)
	{
		___Name_0 = value;
		Il2CppCodeGenWriteBarrier((&___Name_0), value);
	}

	inline static int32_t get_offset_of_Attributes_1() { return static_cast<int32_t>(offsetof(MonoIOStat_t592533987, ___Attributes_1)); }
	inline int32_t get_Attributes_1() const { return ___Attributes_1; }
	inline int32_t* get_address_of_Attributes_1() { return &___Attributes_1; }
	inline void set_Attributes_1(int32_t value)
	{
		___Attributes_1 = value;
	}

	inline static int32_t get_offset_of_Length_2() { return static_cast<int32_t>(offsetof(MonoIOStat_t592533987, ___Length_2)); }
	inline int64_t get_Length_2() const { return ___Length_2; }
	inline int64_t* get_address_of_Length_2() { return &___Length_2; }
	inline void set_Length_2(int64_t value)
	{
		___Length_2 = value;
	}

	inline static int32_t get_offset_of_CreationTime_3() { return static_cast<int32_t>(offsetof(MonoIOStat_t592533987, ___CreationTime_3)); }
	inline int64_t get_CreationTime_3() const { return ___CreationTime_3; }
	inline int64_t* get_address_of_CreationTime_3() { return &___CreationTime_3; }
	inline void set_CreationTime_3(int64_t value)
	{
		___CreationTime_3 = value;
	}

	inline static int32_t get_offset_of_LastAccessTime_4() { return static_cast<int32_t>(offsetof(MonoIOStat_t592533987, ___LastAccessTime_4)); }
	inline int64_t get_LastAccessTime_4() const { return ___LastAccessTime_4; }
	inline int64_t* get_address_of_LastAccessTime_4() { return &___LastAccessTime_4; }
	inline void set_LastAccessTime_4(int64_t value)
	{
		___LastAccessTime_4 = value;
	}

	inline static int32_t get_offset_of_LastWriteTime_5() { return static_cast<int32_t>(offsetof(MonoIOStat_t592533987, ___LastWriteTime_5)); }
	inline int64_t get_LastWriteTime_5() const { return ___LastWriteTime_5; }
	inline int64_t* get_address_of_LastWriteTime_5() { return &___LastWriteTime_5; }
	inline void set_LastWriteTime_5(int64_t value)
	{
		___LastWriteTime_5 = value;
	}
};

#ifdef __clang__
#pragma clang diagnostic pop
#endif
// Native definition for P/Invoke marshalling of System.IO.MonoIOStat
struct MonoIOStat_t592533987_marshaled_pinvoke
{
	char* ___Name_0;
	int32_t ___Attributes_1;
	int64_t ___Length_2;
	int64_t ___CreationTime_3;
	int64_t ___LastAccessTime_4;
	int64_t ___LastWriteTime_5;
};
// Native definition for COM marshalling of System.IO.MonoIOStat
struct MonoIOStat_t592533987_marshaled_com
{
	Il2CppChar* ___Name_0;
	int32_t ___Attributes_1;
	int64_t ___Length_2;
	int64_t ___CreationTime_3;
	int64_t ___LastAccessTime_4;
	int64_t ___LastWriteTime_5;
};
#endif // MONOIOSTAT_T592533987_H
#ifndef GAMEOBJECT_T1113636619_H
#define GAMEOBJECT_T1113636619_H
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif

// UnityEngine.GameObject
struct  GameObject_t1113636619  : public Object_t631007953
{
public:

public:
};

#ifdef __clang__
#pragma clang diagnostic pop
#endif
#endif // GAMEOBJECT_T1113636619_H
#ifndef COMPONENT_T1923634451_H
#define COMPONENT_T1923634451_H
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif

// UnityEngine.Component
struct  Component_t1923634451  : public Object_t631007953
{
public:

public:
};

#ifdef __clang__
#pragma clang diagnostic pop
#endif
#endif // COMPONENT_T1923634451_H
#ifndef FILENOTFOUNDEXCEPTION_T225391025_H
#define FILENOTFOUNDEXCEPTION_T225391025_H
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif

// System.IO.FileNotFoundException
struct  FileNotFoundException_t225391025  : public IOException_t4088381929
{
public:
	// System.String System.IO.FileNotFoundException::fileName
	String_t* ___fileName_11;
	// System.String System.IO.FileNotFoundException::fusionLog
	String_t* ___fusionLog_12;

public:
	inline static int32_t get_offset_of_fileName_11() { return static_cast<int32_t>(offsetof(FileNotFoundException_t225391025, ___fileName_11)); }
	inline String_t* get_fileName_11() const { return ___fileName_11; }
	inline String_t** get_address_of_fileName_11() { return &___fileName_11; }
	inline void set_fileName_11(String_t* value)
	{
		___fileName_11 = value;
		Il2CppCodeGenWriteBarrier((&___fileName_11), value);
	}

	inline static int32_t get_offset_of_fusionLog_12() { return static_cast<int32_t>(offsetof(FileNotFoundException_t225391025, ___fusionLog_12)); }
	inline String_t* get_fusionLog_12() const { return ___fusionLog_12; }
	inline String_t** get_address_of_fusionLog_12() { return &___fusionLog_12; }
	inline void set_fusionLog_12(String_t* value)
	{
		___fusionLog_12 = value;
		Il2CppCodeGenWriteBarrier((&___fusionLog_12), value);
	}
};

#ifdef __clang__
#pragma clang diagnostic pop
#endif
#endif // FILENOTFOUNDEXCEPTION_T225391025_H
#ifndef TEXTURE_T3661962703_H
#define TEXTURE_T3661962703_H
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif

// UnityEngine.Texture
struct  Texture_t3661962703  : public Object_t631007953
{
public:

public:
};

#ifdef __clang__
#pragma clang diagnostic pop
#endif
#endif // TEXTURE_T3661962703_H
#ifndef MULTICASTDELEGATE_T_H
#define MULTICASTDELEGATE_T_H
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif

// System.MulticastDelegate
struct  MulticastDelegate_t  : public Delegate_t1188392813
{
public:
	// System.MulticastDelegate System.MulticastDelegate::prev
	MulticastDelegate_t * ___prev_9;
	// System.MulticastDelegate System.MulticastDelegate::kpm_next
	MulticastDelegate_t * ___kpm_next_10;

public:
	inline static int32_t get_offset_of_prev_9() { return static_cast<int32_t>(offsetof(MulticastDelegate_t, ___prev_9)); }
	inline MulticastDelegate_t * get_prev_9() const { return ___prev_9; }
	inline MulticastDelegate_t ** get_address_of_prev_9() { return &___prev_9; }
	inline void set_prev_9(MulticastDelegate_t * value)
	{
		___prev_9 = value;
		Il2CppCodeGenWriteBarrier((&___prev_9), value);
	}

	inline static int32_t get_offset_of_kpm_next_10() { return static_cast<int32_t>(offsetof(MulticastDelegate_t, ___kpm_next_10)); }
	inline MulticastDelegate_t * get_kpm_next_10() const { return ___kpm_next_10; }
	inline MulticastDelegate_t ** get_address_of_kpm_next_10() { return &___kpm_next_10; }
	inline void set_kpm_next_10(MulticastDelegate_t * value)
	{
		___kpm_next_10 = value;
		Il2CppCodeGenWriteBarrier((&___kpm_next_10), value);
	}
};

#ifdef __clang__
#pragma clang diagnostic pop
#endif
#endif // MULTICASTDELEGATE_T_H
#ifndef BEHAVIOUR_T1437897464_H
#define BEHAVIOUR_T1437897464_H
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif

// UnityEngine.Behaviour
struct  Behaviour_t1437897464  : public Component_t1923634451
{
public:

public:
};

#ifdef __clang__
#pragma clang diagnostic pop
#endif
#endif // BEHAVIOUR_T1437897464_H
#ifndef MEDIASAVECALLBACK_T1711154875_H
#define MEDIASAVECALLBACK_T1711154875_H
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif

// NativeGallery/MediaSaveCallback
struct  MediaSaveCallback_t1711154875  : public MulticastDelegate_t
{
public:

public:
};

#ifdef __clang__
#pragma clang diagnostic pop
#endif
#endif // MEDIASAVECALLBACK_T1711154875_H
#ifndef TEXTURE2D_T3840446185_H
#define TEXTURE2D_T3840446185_H
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif

// UnityEngine.Texture2D
struct  Texture2D_t3840446185  : public Texture_t3661962703
{
public:

public:
};

#ifdef __clang__
#pragma clang diagnostic pop
#endif
#endif // TEXTURE2D_T3840446185_H
#ifndef FILESYSTEMINFO_T3745885336_H
#define FILESYSTEMINFO_T3745885336_H
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif

// System.IO.FileSystemInfo
struct  FileSystemInfo_t3745885336  : public MarshalByRefObject_t2760389100
{
public:
	// System.String System.IO.FileSystemInfo::FullPath
	String_t* ___FullPath_1;
	// System.String System.IO.FileSystemInfo::OriginalPath
	String_t* ___OriginalPath_2;
	// System.IO.MonoIOStat System.IO.FileSystemInfo::stat
	MonoIOStat_t592533987  ___stat_3;
	// System.Boolean System.IO.FileSystemInfo::valid
	bool ___valid_4;

public:
	inline static int32_t get_offset_of_FullPath_1() { return static_cast<int32_t>(offsetof(FileSystemInfo_t3745885336, ___FullPath_1)); }
	inline String_t* get_FullPath_1() const { return ___FullPath_1; }
	inline String_t** get_address_of_FullPath_1() { return &___FullPath_1; }
	inline void set_FullPath_1(String_t* value)
	{
		___FullPath_1 = value;
		Il2CppCodeGenWriteBarrier((&___FullPath_1), value);
	}

	inline static int32_t get_offset_of_OriginalPath_2() { return static_cast<int32_t>(offsetof(FileSystemInfo_t3745885336, ___OriginalPath_2)); }
	inline String_t* get_OriginalPath_2() const { return ___OriginalPath_2; }
	inline String_t** get_address_of_OriginalPath_2() { return &___OriginalPath_2; }
	inline void set_OriginalPath_2(String_t* value)
	{
		___OriginalPath_2 = value;
		Il2CppCodeGenWriteBarrier((&___OriginalPath_2), value);
	}

	inline static int32_t get_offset_of_stat_3() { return static_cast<int32_t>(offsetof(FileSystemInfo_t3745885336, ___stat_3)); }
	inline MonoIOStat_t592533987  get_stat_3() const { return ___stat_3; }
	inline MonoIOStat_t592533987 * get_address_of_stat_3() { return &___stat_3; }
	inline void set_stat_3(MonoIOStat_t592533987  value)
	{
		___stat_3 = value;
	}

	inline static int32_t get_offset_of_valid_4() { return static_cast<int32_t>(offsetof(FileSystemInfo_t3745885336, ___valid_4)); }
	inline bool get_valid_4() const { return ___valid_4; }
	inline bool* get_address_of_valid_4() { return &___valid_4; }
	inline void set_valid_4(bool value)
	{
		___valid_4 = value;
	}
};

#ifdef __clang__
#pragma clang diagnostic pop
#endif
#endif // FILESYSTEMINFO_T3745885336_H
#ifndef MEDIAPICKMULTIPLECALLBACK_T2483155519_H
#define MEDIAPICKMULTIPLECALLBACK_T2483155519_H
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif

// NativeGallery/MediaPickMultipleCallback
struct  MediaPickMultipleCallback_t2483155519  : public MulticastDelegate_t
{
public:

public:
};

#ifdef __clang__
#pragma clang diagnostic pop
#endif
#endif // MEDIAPICKMULTIPLECALLBACK_T2483155519_H
#ifndef MEDIAPICKCALLBACK_T2468098299_H
#define MEDIAPICKCALLBACK_T2468098299_H
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif

// NativeGallery/MediaPickCallback
struct  MediaPickCallback_t2468098299  : public MulticastDelegate_t
{
public:

public:
};

#ifdef __clang__
#pragma clang diagnostic pop
#endif
#endif // MEDIAPICKCALLBACK_T2468098299_H
#ifndef ASYNCCALLBACK_T3962456242_H
#define ASYNCCALLBACK_T3962456242_H
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif

// System.AsyncCallback
struct  AsyncCallback_t3962456242  : public MulticastDelegate_t
{
public:

public:
};

#ifdef __clang__
#pragma clang diagnostic pop
#endif
#endif // ASYNCCALLBACK_T3962456242_H
#ifndef DIRECTORYINFO_T35957480_H
#define DIRECTORYINFO_T35957480_H
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif

// System.IO.DirectoryInfo
struct  DirectoryInfo_t35957480  : public FileSystemInfo_t3745885336
{
public:
	// System.String System.IO.DirectoryInfo::current
	String_t* ___current_5;
	// System.String System.IO.DirectoryInfo::parent
	String_t* ___parent_6;

public:
	inline static int32_t get_offset_of_current_5() { return static_cast<int32_t>(offsetof(DirectoryInfo_t35957480, ___current_5)); }
	inline String_t* get_current_5() const { return ___current_5; }
	inline String_t** get_address_of_current_5() { return &___current_5; }
	inline void set_current_5(String_t* value)
	{
		___current_5 = value;
		Il2CppCodeGenWriteBarrier((&___current_5), value);
	}

	inline static int32_t get_offset_of_parent_6() { return static_cast<int32_t>(offsetof(DirectoryInfo_t35957480, ___parent_6)); }
	inline String_t* get_parent_6() const { return ___parent_6; }
	inline String_t** get_address_of_parent_6() { return &___parent_6; }
	inline void set_parent_6(String_t* value)
	{
		___parent_6 = value;
		Il2CppCodeGenWriteBarrier((&___parent_6), value);
	}
};

#ifdef __clang__
#pragma clang diagnostic pop
#endif
#endif // DIRECTORYINFO_T35957480_H
#ifndef MONOBEHAVIOUR_T3962482529_H
#define MONOBEHAVIOUR_T3962482529_H
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif

// UnityEngine.MonoBehaviour
struct  MonoBehaviour_t3962482529  : public Behaviour_t1437897464
{
public:

public:
};

#ifdef __clang__
#pragma clang diagnostic pop
#endif
#endif // MONOBEHAVIOUR_T3962482529_H
#ifndef NGMEDIASAVECALLBACKIOS_T2373647639_H
#define NGMEDIASAVECALLBACKIOS_T2373647639_H
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif

// NativeGalleryNamespace.NGMediaSaveCallbackiOS
struct  NGMediaSaveCallbackiOS_t2373647639  : public MonoBehaviour_t3962482529
{
public:
	// NativeGallery/MediaSaveCallback NativeGalleryNamespace.NGMediaSaveCallbackiOS::callback
	MediaSaveCallback_t1711154875 * ___callback_3;

public:
	inline static int32_t get_offset_of_callback_3() { return static_cast<int32_t>(offsetof(NGMediaSaveCallbackiOS_t2373647639, ___callback_3)); }
	inline MediaSaveCallback_t1711154875 * get_callback_3() const { return ___callback_3; }
	inline MediaSaveCallback_t1711154875 ** get_address_of_callback_3() { return &___callback_3; }
	inline void set_callback_3(MediaSaveCallback_t1711154875 * value)
	{
		___callback_3 = value;
		Il2CppCodeGenWriteBarrier((&___callback_3), value);
	}
};

struct NGMediaSaveCallbackiOS_t2373647639_StaticFields
{
public:
	// NativeGalleryNamespace.NGMediaSaveCallbackiOS NativeGalleryNamespace.NGMediaSaveCallbackiOS::instance
	NGMediaSaveCallbackiOS_t2373647639 * ___instance_2;

public:
	inline static int32_t get_offset_of_instance_2() { return static_cast<int32_t>(offsetof(NGMediaSaveCallbackiOS_t2373647639_StaticFields, ___instance_2)); }
	inline NGMediaSaveCallbackiOS_t2373647639 * get_instance_2() const { return ___instance_2; }
	inline NGMediaSaveCallbackiOS_t2373647639 ** get_address_of_instance_2() { return &___instance_2; }
	inline void set_instance_2(NGMediaSaveCallbackiOS_t2373647639 * value)
	{
		___instance_2 = value;
		Il2CppCodeGenWriteBarrier((&___instance_2), value);
	}
};

#ifdef __clang__
#pragma clang diagnostic pop
#endif
#endif // NGMEDIASAVECALLBACKIOS_T2373647639_H
#ifndef NGMEDIARECEIVECALLBACKIOS_T840779778_H
#define NGMEDIARECEIVECALLBACKIOS_T840779778_H
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif

// NativeGalleryNamespace.NGMediaReceiveCallbackiOS
struct  NGMediaReceiveCallbackiOS_t840779778  : public MonoBehaviour_t3962482529
{
public:
	// NativeGallery/MediaPickCallback NativeGalleryNamespace.NGMediaReceiveCallbackiOS::callback
	MediaPickCallback_t2468098299 * ___callback_3;
	// System.Single NativeGalleryNamespace.NGMediaReceiveCallbackiOS::nextBusyCheckTime
	float ___nextBusyCheckTime_4;

public:
	inline static int32_t get_offset_of_callback_3() { return static_cast<int32_t>(offsetof(NGMediaReceiveCallbackiOS_t840779778, ___callback_3)); }
	inline MediaPickCallback_t2468098299 * get_callback_3() const { return ___callback_3; }
	inline MediaPickCallback_t2468098299 ** get_address_of_callback_3() { return &___callback_3; }
	inline void set_callback_3(MediaPickCallback_t2468098299 * value)
	{
		___callback_3 = value;
		Il2CppCodeGenWriteBarrier((&___callback_3), value);
	}

	inline static int32_t get_offset_of_nextBusyCheckTime_4() { return static_cast<int32_t>(offsetof(NGMediaReceiveCallbackiOS_t840779778, ___nextBusyCheckTime_4)); }
	inline float get_nextBusyCheckTime_4() const { return ___nextBusyCheckTime_4; }
	inline float* get_address_of_nextBusyCheckTime_4() { return &___nextBusyCheckTime_4; }
	inline void set_nextBusyCheckTime_4(float value)
	{
		___nextBusyCheckTime_4 = value;
	}
};

struct NGMediaReceiveCallbackiOS_t840779778_StaticFields
{
public:
	// NativeGalleryNamespace.NGMediaReceiveCallbackiOS NativeGalleryNamespace.NGMediaReceiveCallbackiOS::instance
	NGMediaReceiveCallbackiOS_t840779778 * ___instance_2;
	// System.Boolean NativeGalleryNamespace.NGMediaReceiveCallbackiOS::<IsBusy>k__BackingField
	bool ___U3CIsBusyU3Ek__BackingField_5;

public:
	inline static int32_t get_offset_of_instance_2() { return static_cast<int32_t>(offsetof(NGMediaReceiveCallbackiOS_t840779778_StaticFields, ___instance_2)); }
	inline NGMediaReceiveCallbackiOS_t840779778 * get_instance_2() const { return ___instance_2; }
	inline NGMediaReceiveCallbackiOS_t840779778 ** get_address_of_instance_2() { return &___instance_2; }
	inline void set_instance_2(NGMediaReceiveCallbackiOS_t840779778 * value)
	{
		___instance_2 = value;
		Il2CppCodeGenWriteBarrier((&___instance_2), value);
	}

	inline static int32_t get_offset_of_U3CIsBusyU3Ek__BackingField_5() { return static_cast<int32_t>(offsetof(NGMediaReceiveCallbackiOS_t840779778_StaticFields, ___U3CIsBusyU3Ek__BackingField_5)); }
	inline bool get_U3CIsBusyU3Ek__BackingField_5() const { return ___U3CIsBusyU3Ek__BackingField_5; }
	inline bool* get_address_of_U3CIsBusyU3Ek__BackingField_5() { return &___U3CIsBusyU3Ek__BackingField_5; }
	inline void set_U3CIsBusyU3Ek__BackingField_5(bool value)
	{
		___U3CIsBusyU3Ek__BackingField_5 = value;
	}
};

#ifdef __clang__
#pragma clang diagnostic pop
#endif
#endif // NGMEDIARECEIVECALLBACKIOS_T840779778_H
// System.Byte[]
struct ByteU5BU5D_t4116647657  : public RuntimeArray
{
public:
	ALIGN_FIELD (8) uint8_t m_Items[1];

public:
	inline uint8_t GetAt(il2cpp_array_size_t index) const
	{
		IL2CPP_ARRAY_BOUNDS_CHECK(index, (uint32_t)(this)->max_length);
		return m_Items[index];
	}
	inline uint8_t* GetAddressAt(il2cpp_array_size_t index)
	{
		IL2CPP_ARRAY_BOUNDS_CHECK(index, (uint32_t)(this)->max_length);
		return m_Items + index;
	}
	inline void SetAt(il2cpp_array_size_t index, uint8_t value)
	{
		IL2CPP_ARRAY_BOUNDS_CHECK(index, (uint32_t)(this)->max_length);
		m_Items[index] = value;
	}
	inline uint8_t GetAtUnchecked(il2cpp_array_size_t index) const
	{
		return m_Items[index];
	}
	inline uint8_t* GetAddressAtUnchecked(il2cpp_array_size_t index)
	{
		return m_Items + index;
	}
	inline void SetAtUnchecked(il2cpp_array_size_t index, uint8_t value)
	{
		m_Items[index] = value;
	}
};
// System.String[]
struct StringU5BU5D_t1281789340  : public RuntimeArray
{
public:
	ALIGN_FIELD (8) String_t* m_Items[1];

public:
	inline String_t* GetAt(il2cpp_array_size_t index) const
	{
		IL2CPP_ARRAY_BOUNDS_CHECK(index, (uint32_t)(this)->max_length);
		return m_Items[index];
	}
	inline String_t** GetAddressAt(il2cpp_array_size_t index)
	{
		IL2CPP_ARRAY_BOUNDS_CHECK(index, (uint32_t)(this)->max_length);
		return m_Items + index;
	}
	inline void SetAt(il2cpp_array_size_t index, String_t* value)
	{
		IL2CPP_ARRAY_BOUNDS_CHECK(index, (uint32_t)(this)->max_length);
		m_Items[index] = value;
		Il2CppCodeGenWriteBarrier(m_Items + index, value);
	}
	inline String_t* GetAtUnchecked(il2cpp_array_size_t index) const
	{
		return m_Items[index];
	}
	inline String_t** GetAddressAtUnchecked(il2cpp_array_size_t index)
	{
		return m_Items + index;
	}
	inline void SetAtUnchecked(il2cpp_array_size_t index, String_t* value)
	{
		m_Items[index] = value;
		Il2CppCodeGenWriteBarrier(m_Items + index, value);
	}
};
// System.Char[]
struct CharU5BU5D_t3528271667  : public RuntimeArray
{
public:
	ALIGN_FIELD (8) Il2CppChar m_Items[1];

public:
	inline Il2CppChar GetAt(il2cpp_array_size_t index) const
	{
		IL2CPP_ARRAY_BOUNDS_CHECK(index, (uint32_t)(this)->max_length);
		return m_Items[index];
	}
	inline Il2CppChar* GetAddressAt(il2cpp_array_size_t index)
	{
		IL2CPP_ARRAY_BOUNDS_CHECK(index, (uint32_t)(this)->max_length);
		return m_Items + index;
	}
	inline void SetAt(il2cpp_array_size_t index, Il2CppChar value)
	{
		IL2CPP_ARRAY_BOUNDS_CHECK(index, (uint32_t)(this)->max_length);
		m_Items[index] = value;
	}
	inline Il2CppChar GetAtUnchecked(il2cpp_array_size_t index) const
	{
		return m_Items[index];
	}
	inline Il2CppChar* GetAddressAtUnchecked(il2cpp_array_size_t index)
	{
		return m_Items + index;
	}
	inline void SetAtUnchecked(il2cpp_array_size_t index, Il2CppChar value)
	{
		m_Items[index] = value;
	}
};


// !!0 UnityEngine.GameObject::AddComponent<System.Object>()
extern "C"  RuntimeObject * GameObject_AddComponent_TisRuntimeObject_m3469369570_gshared (GameObject_t1113636619 * __this, const RuntimeMethod* method);

// System.String UnityEngine.Application::get_temporaryCachePath()
extern "C"  String_t* Application_get_temporaryCachePath_m1214546342 (RuntimeObject * __this /* static, unused */, const RuntimeMethod* method) IL2CPP_METHOD_ATTR;
// System.String System.IO.Path::Combine(System.String,System.String)
extern "C"  String_t* Path_Combine_m3389272516 (RuntimeObject * __this /* static, unused */, String_t* p0, String_t* p1, const RuntimeMethod* method) IL2CPP_METHOD_ATTR;
// System.IO.DirectoryInfo System.IO.Directory::CreateDirectory(System.String)
extern "C"  DirectoryInfo_t35957480 * Directory_CreateDirectory_m751642867 (RuntimeObject * __this /* static, unused */, String_t* p0, const RuntimeMethod* method) IL2CPP_METHOD_ATTR;
// System.Int32 NativeGallery::_NativeGallery_CheckPermission()
extern "C"  int32_t NativeGallery__NativeGallery_CheckPermission_m2442021883 (RuntimeObject * __this /* static, unused */, const RuntimeMethod* method) IL2CPP_METHOD_ATTR;
// System.Int32 NativeGallery::_NativeGallery_RequestPermission()
extern "C"  int32_t NativeGallery__NativeGallery_RequestPermission_m3800542249 (RuntimeObject * __this /* static, unused */, const RuntimeMethod* method) IL2CPP_METHOD_ATTR;
// System.Int32 NativeGallery::_NativeGallery_CanOpenSettings()
extern "C"  int32_t NativeGallery__NativeGallery_CanOpenSettings_m589168296 (RuntimeObject * __this /* static, unused */, const RuntimeMethod* method) IL2CPP_METHOD_ATTR;
// System.Void NativeGallery::_NativeGallery_OpenSettings()
extern "C"  void NativeGallery__NativeGallery_OpenSettings_m1115625722 (RuntimeObject * __this /* static, unused */, const RuntimeMethod* method) IL2CPP_METHOD_ATTR;
// NativeGallery/Permission NativeGallery::SaveToGallery(System.Byte[],System.String,System.String,System.Boolean,NativeGallery/MediaSaveCallback)
extern "C"  int32_t NativeGallery_SaveToGallery_m3366416885 (RuntimeObject * __this /* static, unused */, ByteU5BU5D_t4116647657* ___mediaBytes0, String_t* ___album1, String_t* ___filenameFormatted2, bool ___isImage3, MediaSaveCallback_t1711154875 * ___callback4, const RuntimeMethod* method) IL2CPP_METHOD_ATTR;
// NativeGallery/Permission NativeGallery::SaveToGallery(System.String,System.String,System.String,System.Boolean,NativeGallery/MediaSaveCallback)
extern "C"  int32_t NativeGallery_SaveToGallery_m4000209401 (RuntimeObject * __this /* static, unused */, String_t* ___existingMediaPath0, String_t* ___album1, String_t* ___filenameFormatted2, bool ___isImage3, MediaSaveCallback_t1711154875 * ___callback4, const RuntimeMethod* method) IL2CPP_METHOD_ATTR;
// System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
extern "C"  bool Object_op_Equality_m1810815630 (RuntimeObject * __this /* static, unused */, Object_t631007953 * p0, Object_t631007953 * p1, const RuntimeMethod* method) IL2CPP_METHOD_ATTR;
// System.Void System.ArgumentException::.ctor(System.String)
extern "C"  void ArgumentException__ctor_m1312628991 (ArgumentException_t132251570 * __this, String_t* p0, const RuntimeMethod* method) IL2CPP_METHOD_ATTR;
// System.Boolean System.String::EndsWith(System.String)
extern "C"  bool String_EndsWith_m1901926500 (String_t* __this, String_t* p0, const RuntimeMethod* method) IL2CPP_METHOD_ATTR;
// System.Byte[] UnityEngine.ImageConversion::EncodeToJPG(UnityEngine.Texture2D,System.Int32)
extern "C"  ByteU5BU5D_t4116647657* ImageConversion_EncodeToJPG_m2489668130 (RuntimeObject * __this /* static, unused */, Texture2D_t3840446185 * p0, int32_t p1, const RuntimeMethod* method) IL2CPP_METHOD_ATTR;
// System.Byte[] UnityEngine.ImageConversion::EncodeToPNG(UnityEngine.Texture2D)
extern "C"  ByteU5BU5D_t4116647657* ImageConversion_EncodeToPNG_m2292631531 (RuntimeObject * __this /* static, unused */, Texture2D_t3840446185 * p0, const RuntimeMethod* method) IL2CPP_METHOD_ATTR;
// System.String System.String::Concat(System.String,System.String)
extern "C"  String_t* String_Concat_m3937257545 (RuntimeObject * __this /* static, unused */, String_t* p0, String_t* p1, const RuntimeMethod* method) IL2CPP_METHOD_ATTR;
// NativeGallery/Permission NativeGallery::GetMediaFromGallery(NativeGallery/MediaPickCallback,System.Boolean,System.String,System.String,System.Int32)
extern "C"  int32_t NativeGallery_GetMediaFromGallery_m2807044920 (RuntimeObject * __this /* static, unused */, MediaPickCallback_t2468098299 * ___callback0, bool ___imageMode1, String_t* ___mime2, String_t* ___title3, int32_t ___maxSize4, const RuntimeMethod* method) IL2CPP_METHOD_ATTR;
// NativeGallery/Permission NativeGallery::GetMultipleMediaFromGallery(NativeGallery/MediaPickMultipleCallback,System.Boolean,System.String,System.String,System.Int32)
extern "C"  int32_t NativeGallery_GetMultipleMediaFromGallery_m1977049241 (RuntimeObject * __this /* static, unused */, MediaPickMultipleCallback_t2483155519 * ___callback0, bool ___imageMode1, String_t* ___mime2, String_t* ___title3, int32_t ___maxSize4, const RuntimeMethod* method) IL2CPP_METHOD_ATTR;
// System.Boolean NativeGalleryNamespace.NGMediaReceiveCallbackiOS::get_IsBusy()
extern "C"  bool NGMediaReceiveCallbackiOS_get_IsBusy_m4210058844 (RuntimeObject * __this /* static, unused */, const RuntimeMethod* method) IL2CPP_METHOD_ATTR;
// NativeGallery/Permission NativeGallery::RequestPermission()
extern "C"  int32_t NativeGallery_RequestPermission_m3085250992 (RuntimeObject * __this /* static, unused */, const RuntimeMethod* method) IL2CPP_METHOD_ATTR;
// System.Int32 System.String::get_Length()
extern "C"  int32_t String_get_Length_m3847582255 (String_t* __this, const RuntimeMethod* method) IL2CPP_METHOD_ATTR;
// System.String NativeGallery::GetSavePath(System.String,System.String)
extern "C"  String_t* NativeGallery_GetSavePath_m938747003 (RuntimeObject * __this /* static, unused */, String_t* ___album0, String_t* ___filenameFormatted1, const RuntimeMethod* method) IL2CPP_METHOD_ATTR;
// System.Void System.IO.File::WriteAllBytes(System.String,System.Byte[])
extern "C"  void File_WriteAllBytes_m4252682105 (RuntimeObject * __this /* static, unused */, String_t* p0, ByteU5BU5D_t4116647657* p1, const RuntimeMethod* method) IL2CPP_METHOD_ATTR;
// System.Void NativeGallery::SaveToGalleryInternal(System.String,System.String,System.Boolean,NativeGallery/MediaSaveCallback)
extern "C"  void NativeGallery_SaveToGalleryInternal_m2106641 (RuntimeObject * __this /* static, unused */, String_t* ___path0, String_t* ___album1, bool ___isImage2, MediaSaveCallback_t1711154875 * ___callback3, const RuntimeMethod* method) IL2CPP_METHOD_ATTR;
// System.Boolean System.IO.File::Exists(System.String)
extern "C"  bool File_Exists_m3943585060 (RuntimeObject * __this /* static, unused */, String_t* p0, const RuntimeMethod* method) IL2CPP_METHOD_ATTR;
// System.Void System.IO.FileNotFoundException::.ctor(System.String)
extern "C"  void FileNotFoundException__ctor_m3252664930 (FileNotFoundException_t225391025 * __this, String_t* p0, const RuntimeMethod* method) IL2CPP_METHOD_ATTR;
// System.Void System.IO.File::Copy(System.String,System.String,System.Boolean)
extern "C"  void File_Copy_m3433232803 (RuntimeObject * __this /* static, unused */, String_t* p0, String_t* p1, bool p2, const RuntimeMethod* method) IL2CPP_METHOD_ATTR;
// System.Void NativeGalleryNamespace.NGMediaSaveCallbackiOS::Initialize(NativeGallery/MediaSaveCallback)
extern "C"  void NGMediaSaveCallbackiOS_Initialize_m3647472094 (RuntimeObject * __this /* static, unused */, MediaSaveCallback_t1711154875 * ___callback0, const RuntimeMethod* method) IL2CPP_METHOD_ATTR;
// System.Void NativeGallery::_NativeGallery_ImageWriteToAlbum(System.String,System.String)
extern "C"  void NativeGallery__NativeGallery_ImageWriteToAlbum_m3596037857 (RuntimeObject * __this /* static, unused */, String_t* ___path0, String_t* ___album1, const RuntimeMethod* method) IL2CPP_METHOD_ATTR;
// System.Void NativeGallery::_NativeGallery_VideoWriteToAlbum(System.String,System.String)
extern "C"  void NativeGallery__NativeGallery_VideoWriteToAlbum_m4166028978 (RuntimeObject * __this /* static, unused */, String_t* ___path0, String_t* ___album1, const RuntimeMethod* method) IL2CPP_METHOD_ATTR;
// System.String System.IO.Path::GetFileName(System.String)
extern "C"  String_t* Path_GetFileName_m1354558116 (RuntimeObject * __this /* static, unused */, String_t* p0, const RuntimeMethod* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.Debug::Log(System.Object)
extern "C"  void Debug_Log_m4051431634 (RuntimeObject * __this /* static, unused */, RuntimeObject * p0, const RuntimeMethod* method) IL2CPP_METHOD_ATTR;
// System.String UnityEngine.Application::get_persistentDataPath()
extern "C"  String_t* Application_get_persistentDataPath_m1428108154 (RuntimeObject * __this /* static, unused */, const RuntimeMethod* method) IL2CPP_METHOD_ATTR;
// System.Boolean System.String::Contains(System.String)
extern "C"  bool String_Contains_m1147431944 (String_t* __this, String_t* p0, const RuntimeMethod* method) IL2CPP_METHOD_ATTR;
// System.String System.String::Format(System.String,System.Object)
extern "C"  String_t* String_Format_m2844511972 (RuntimeObject * __this /* static, unused */, String_t* p0, RuntimeObject * p1, const RuntimeMethod* method) IL2CPP_METHOD_ATTR;
// System.String System.IO.Path::GetFileNameWithoutExtension(System.String)
extern "C"  String_t* Path_GetFileNameWithoutExtension_m895535029 (RuntimeObject * __this /* static, unused */, String_t* p0, const RuntimeMethod* method) IL2CPP_METHOD_ATTR;
// System.String System.IO.Path::GetExtension(System.String)
extern "C"  String_t* Path_GetExtension_m1021339115 (RuntimeObject * __this /* static, unused */, String_t* p0, const RuntimeMethod* method) IL2CPP_METHOD_ATTR;
// System.String System.String::Concat(System.String,System.String,System.String)
extern "C"  String_t* String_Concat_m3755062657 (RuntimeObject * __this /* static, unused */, String_t* p0, String_t* p1, String_t* p2, const RuntimeMethod* method) IL2CPP_METHOD_ATTR;
// System.Boolean NativeGallery::IsMediaPickerBusy()
extern "C"  bool NativeGallery_IsMediaPickerBusy_m3841585438 (RuntimeObject * __this /* static, unused */, const RuntimeMethod* method) IL2CPP_METHOD_ATTR;
// System.Void NativeGalleryNamespace.NGMediaReceiveCallbackiOS::Initialize(NativeGallery/MediaPickCallback)
extern "C"  void NGMediaReceiveCallbackiOS_Initialize_m2371316744 (RuntimeObject * __this /* static, unused */, MediaPickCallback_t2468098299 * ___callback0, const RuntimeMethod* method) IL2CPP_METHOD_ATTR;
// System.Int32 UnityEngine.SystemInfo::get_maxTextureSize()
extern "C"  int32_t SystemInfo_get_maxTextureSize_m2715296278 (RuntimeObject * __this /* static, unused */, const RuntimeMethod* method) IL2CPP_METHOD_ATTR;
// System.String NativeGallery::get_IOSSelectedImagePath()
extern "C"  String_t* NativeGallery_get_IOSSelectedImagePath_m2691245459 (RuntimeObject * __this /* static, unused */, const RuntimeMethod* method) IL2CPP_METHOD_ATTR;
// System.Void NativeGallery::_NativeGallery_PickImage(System.String,System.Int32)
extern "C"  void NativeGallery__NativeGallery_PickImage_m1523393289 (RuntimeObject * __this /* static, unused */, String_t* ___imageSavePath0, int32_t ___maxSize1, const RuntimeMethod* method) IL2CPP_METHOD_ATTR;
// System.Void NativeGallery::_NativeGallery_PickVideo()
extern "C"  void NativeGallery__NativeGallery_PickVideo_m2940838827 (RuntimeObject * __this /* static, unused */, const RuntimeMethod* method) IL2CPP_METHOD_ATTR;
// System.Boolean NativeGallery::CanSelectMultipleFilesFromGallery()
extern "C"  bool NativeGallery_CanSelectMultipleFilesFromGallery_m1434233298 (RuntimeObject * __this /* static, unused */, const RuntimeMethod* method) IL2CPP_METHOD_ATTR;
// System.Void NativeGallery/MediaPickMultipleCallback::Invoke(System.String[])
extern "C"  void MediaPickMultipleCallback_Invoke_m898928969 (MediaPickMultipleCallback_t2483155519 * __this, StringU5BU5D_t1281789340* ___paths0, const RuntimeMethod* method) IL2CPP_METHOD_ATTR;
// System.Boolean System.String::IsNullOrEmpty(System.String)
extern "C"  bool String_IsNullOrEmpty_m2969720369 (RuntimeObject * __this /* static, unused */, String_t* p0, const RuntimeMethod* method) IL2CPP_METHOD_ATTR;
// System.String NativeGallery::get_TemporaryImagePath()
extern "C"  String_t* NativeGallery_get_TemporaryImagePath_m1358311393 (RuntimeObject * __this /* static, unused */, const RuntimeMethod* method) IL2CPP_METHOD_ATTR;
// System.String NativeGallery::_NativeGallery_LoadImageAtPath(System.String,System.String,System.Int32)
extern "C"  String_t* NativeGallery__NativeGallery_LoadImageAtPath_m570075515 (RuntimeObject * __this /* static, unused */, String_t* ___path0, String_t* ___temporaryFilePath1, int32_t ___maxSize2, const RuntimeMethod* method) IL2CPP_METHOD_ATTR;
// System.String System.String::ToLowerInvariant()
extern "C"  String_t* String_ToLowerInvariant_m110751226 (String_t* __this, const RuntimeMethod* method) IL2CPP_METHOD_ATTR;
// System.Boolean System.String::op_Equality(System.String,System.String)
extern "C"  bool String_op_Equality_m920492651 (RuntimeObject * __this /* static, unused */, String_t* p0, String_t* p1, const RuntimeMethod* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.Texture2D::.ctor(System.Int32,System.Int32,UnityEngine.TextureFormat,System.Boolean,System.Boolean)
extern "C"  void Texture2D__ctor_m1269666504 (Texture2D_t3840446185 * __this, int32_t p0, int32_t p1, int32_t p2, bool p3, bool p4, const RuntimeMethod* method) IL2CPP_METHOD_ATTR;
// System.Byte[] System.IO.File::ReadAllBytes(System.String)
extern "C"  ByteU5BU5D_t4116647657* File_ReadAllBytes_m1435775076 (RuntimeObject * __this /* static, unused */, String_t* p0, const RuntimeMethod* method) IL2CPP_METHOD_ATTR;
// System.Boolean UnityEngine.ImageConversion::LoadImage(UnityEngine.Texture2D,System.Byte[],System.Boolean)
extern "C"  bool ImageConversion_LoadImage_m601733642 (RuntimeObject * __this /* static, unused */, Texture2D_t3840446185 * p0, ByteU5BU5D_t4116647657* p1, bool p2, const RuntimeMethod* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.Object::DestroyImmediate(UnityEngine.Object)
extern "C"  void Object_DestroyImmediate_m3193525861 (RuntimeObject * __this /* static, unused */, Object_t631007953 * p0, const RuntimeMethod* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.Debug::LogException(System.Exception)
extern "C"  void Debug_LogException_m2207318968 (RuntimeObject * __this /* static, unused */, Exception_t * p0, const RuntimeMethod* method) IL2CPP_METHOD_ATTR;
// System.Boolean System.String::op_Inequality(System.String,System.String)
extern "C"  bool String_op_Inequality_m215368492 (RuntimeObject * __this /* static, unused */, String_t* p0, String_t* p1, const RuntimeMethod* method) IL2CPP_METHOD_ATTR;
// System.Void System.IO.File::Delete(System.String)
extern "C"  void File_Delete_m321251800 (RuntimeObject * __this /* static, unused */, String_t* p0, const RuntimeMethod* method) IL2CPP_METHOD_ATTR;
// System.String NativeGallery::_NativeGallery_GetImageProperties(System.String)
extern "C"  String_t* NativeGallery__NativeGallery_GetImageProperties_m210662476 (RuntimeObject * __this /* static, unused */, String_t* ___path0, const RuntimeMethod* method) IL2CPP_METHOD_ATTR;
// System.String[] System.String::Split(System.Char[])
extern "C"  StringU5BU5D_t1281789340* String_Split_m3646115398 (String_t* __this, CharU5BU5D_t3528271667* p0, const RuntimeMethod* method) IL2CPP_METHOD_ATTR;
// System.String System.String::Trim()
extern "C"  String_t* String_Trim_m923598732 (String_t* __this, const RuntimeMethod* method) IL2CPP_METHOD_ATTR;
// System.Boolean System.Int32::TryParse(System.String,System.Int32&)
extern "C"  bool Int32_TryParse_m2404707562 (RuntimeObject * __this /* static, unused */, String_t* p0, int32_t* p1, const RuntimeMethod* method) IL2CPP_METHOD_ATTR;
// System.Void NativeGallery/ImageProperties::.ctor(System.Int32,System.Int32,System.String,NativeGallery/ImageOrientation)
extern "C"  void ImageProperties__ctor_m3374032026 (ImageProperties_t914339828 * __this, int32_t ___width0, int32_t ___height1, String_t* ___mimeType2, int32_t ___orientation3, const RuntimeMethod* method) IL2CPP_METHOD_ATTR;
// System.Void NativeGallery/MediaPickCallback::Invoke(System.String)
extern "C"  void MediaPickCallback_Invoke_m771420990 (MediaPickCallback_t2468098299 * __this, String_t* ___path0, const RuntimeMethod* method) IL2CPP_METHOD_ATTR;
// System.Void NativeGallery/MediaSaveCallback::Invoke(System.String)
extern "C"  void MediaSaveCallback_Invoke_m1355652789 (MediaSaveCallback_t1711154875 * __this, String_t* ___error0, const RuntimeMethod* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.MonoBehaviour::.ctor()
extern "C"  void MonoBehaviour__ctor_m1579109191 (MonoBehaviour_t3962482529 * __this, const RuntimeMethod* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.GameObject::.ctor(System.String)
extern "C"  void GameObject__ctor_m2093116449 (GameObject_t1113636619 * __this, String_t* p0, const RuntimeMethod* method) IL2CPP_METHOD_ATTR;
// !!0 UnityEngine.GameObject::AddComponent<NativeGalleryNamespace.NGMediaReceiveCallbackiOS>()
#define GameObject_AddComponent_TisNGMediaReceiveCallbackiOS_t840779778_m935052088(__this, method) ((  NGMediaReceiveCallbackiOS_t840779778 * (*) (GameObject_t1113636619 *, const RuntimeMethod*))GameObject_AddComponent_TisRuntimeObject_m3469369570_gshared)(__this, method)
// UnityEngine.GameObject UnityEngine.Component::get_gameObject()
extern "C"  GameObject_t1113636619 * Component_get_gameObject_m442555142 (Component_t1923634451 * __this, const RuntimeMethod* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.Object::DontDestroyOnLoad(UnityEngine.Object)
extern "C"  void Object_DontDestroyOnLoad_m166252750 (RuntimeObject * __this /* static, unused */, Object_t631007953 * p0, const RuntimeMethod* method) IL2CPP_METHOD_ATTR;
// System.Single UnityEngine.Time::get_realtimeSinceStartup()
extern "C"  float Time_get_realtimeSinceStartup_m3141794964 (RuntimeObject * __this /* static, unused */, const RuntimeMethod* method) IL2CPP_METHOD_ATTR;
// System.Void NativeGalleryNamespace.NGMediaReceiveCallbackiOS::set_IsBusy(System.Boolean)
extern "C"  void NGMediaReceiveCallbackiOS_set_IsBusy_m2666300196 (RuntimeObject * __this /* static, unused */, bool ___value0, const RuntimeMethod* method) IL2CPP_METHOD_ATTR;
// System.Int32 NativeGalleryNamespace.NGMediaReceiveCallbackiOS::_NativeGallery_IsMediaPickerBusy()
extern "C"  int32_t NGMediaReceiveCallbackiOS__NativeGallery_IsMediaPickerBusy_m3591074261 (RuntimeObject * __this /* static, unused */, const RuntimeMethod* method) IL2CPP_METHOD_ATTR;
// !!0 UnityEngine.GameObject::AddComponent<NativeGalleryNamespace.NGMediaSaveCallbackiOS>()
#define GameObject_AddComponent_TisNGMediaSaveCallbackiOS_t2373647639_m1416436511(__this, method) ((  NGMediaSaveCallbackiOS_t2373647639 * (*) (GameObject_t1113636619 *, const RuntimeMethod*))GameObject_AddComponent_TisRuntimeObject_m3469369570_gshared)(__this, method)
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif
#ifdef __clang__
#pragma clang diagnostic pop
#endif
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif
extern "C" int32_t DEFAULT_CALL _NativeGallery_CheckPermission();
// System.Int32 NativeGallery::_NativeGallery_CheckPermission()
extern "C"  int32_t NativeGallery__NativeGallery_CheckPermission_m2442021883 (RuntimeObject * __this /* static, unused */, const RuntimeMethod* method)
{
	typedef int32_t (DEFAULT_CALL *PInvokeFunc) ();

	// Native function invocation
	int32_t returnValue = reinterpret_cast<PInvokeFunc>(_NativeGallery_CheckPermission)();

	return returnValue;
}
extern "C" int32_t DEFAULT_CALL _NativeGallery_RequestPermission();
// System.Int32 NativeGallery::_NativeGallery_RequestPermission()
extern "C"  int32_t NativeGallery__NativeGallery_RequestPermission_m3800542249 (RuntimeObject * __this /* static, unused */, const RuntimeMethod* method)
{
	typedef int32_t (DEFAULT_CALL *PInvokeFunc) ();

	// Native function invocation
	int32_t returnValue = reinterpret_cast<PInvokeFunc>(_NativeGallery_RequestPermission)();

	return returnValue;
}
extern "C" int32_t DEFAULT_CALL _NativeGallery_CanOpenSettings();
// System.Int32 NativeGallery::_NativeGallery_CanOpenSettings()
extern "C"  int32_t NativeGallery__NativeGallery_CanOpenSettings_m589168296 (RuntimeObject * __this /* static, unused */, const RuntimeMethod* method)
{
	typedef int32_t (DEFAULT_CALL *PInvokeFunc) ();

	// Native function invocation
	int32_t returnValue = reinterpret_cast<PInvokeFunc>(_NativeGallery_CanOpenSettings)();

	return returnValue;
}
extern "C" void DEFAULT_CALL _NativeGallery_OpenSettings();
// System.Void NativeGallery::_NativeGallery_OpenSettings()
extern "C"  void NativeGallery__NativeGallery_OpenSettings_m1115625722 (RuntimeObject * __this /* static, unused */, const RuntimeMethod* method)
{
	typedef void (DEFAULT_CALL *PInvokeFunc) ();

	// Native function invocation
	reinterpret_cast<PInvokeFunc>(_NativeGallery_OpenSettings)();

}
extern "C" void DEFAULT_CALL _NativeGallery_ImageWriteToAlbum(char*, char*);
// System.Void NativeGallery::_NativeGallery_ImageWriteToAlbum(System.String,System.String)
extern "C"  void NativeGallery__NativeGallery_ImageWriteToAlbum_m3596037857 (RuntimeObject * __this /* static, unused */, String_t* ___path0, String_t* ___album1, const RuntimeMethod* method)
{
	typedef void (DEFAULT_CALL *PInvokeFunc) (char*, char*);

	// Marshaling of parameter '___path0' to native representation
	char* ____path0_marshaled = NULL;
	____path0_marshaled = il2cpp_codegen_marshal_string(___path0);

	// Marshaling of parameter '___album1' to native representation
	char* ____album1_marshaled = NULL;
	____album1_marshaled = il2cpp_codegen_marshal_string(___album1);

	// Native function invocation
	reinterpret_cast<PInvokeFunc>(_NativeGallery_ImageWriteToAlbum)(____path0_marshaled, ____album1_marshaled);

	// Marshaling cleanup of parameter '___path0' native representation
	il2cpp_codegen_marshal_free(____path0_marshaled);
	____path0_marshaled = NULL;

	// Marshaling cleanup of parameter '___album1' native representation
	il2cpp_codegen_marshal_free(____album1_marshaled);
	____album1_marshaled = NULL;

}
extern "C" void DEFAULT_CALL _NativeGallery_VideoWriteToAlbum(char*, char*);
// System.Void NativeGallery::_NativeGallery_VideoWriteToAlbum(System.String,System.String)
extern "C"  void NativeGallery__NativeGallery_VideoWriteToAlbum_m4166028978 (RuntimeObject * __this /* static, unused */, String_t* ___path0, String_t* ___album1, const RuntimeMethod* method)
{
	typedef void (DEFAULT_CALL *PInvokeFunc) (char*, char*);

	// Marshaling of parameter '___path0' to native representation
	char* ____path0_marshaled = NULL;
	____path0_marshaled = il2cpp_codegen_marshal_string(___path0);

	// Marshaling of parameter '___album1' to native representation
	char* ____album1_marshaled = NULL;
	____album1_marshaled = il2cpp_codegen_marshal_string(___album1);

	// Native function invocation
	reinterpret_cast<PInvokeFunc>(_NativeGallery_VideoWriteToAlbum)(____path0_marshaled, ____album1_marshaled);

	// Marshaling cleanup of parameter '___path0' native representation
	il2cpp_codegen_marshal_free(____path0_marshaled);
	____path0_marshaled = NULL;

	// Marshaling cleanup of parameter '___album1' native representation
	il2cpp_codegen_marshal_free(____album1_marshaled);
	____album1_marshaled = NULL;

}
extern "C" void DEFAULT_CALL _NativeGallery_PickImage(char*, int32_t);
// System.Void NativeGallery::_NativeGallery_PickImage(System.String,System.Int32)
extern "C"  void NativeGallery__NativeGallery_PickImage_m1523393289 (RuntimeObject * __this /* static, unused */, String_t* ___imageSavePath0, int32_t ___maxSize1, const RuntimeMethod* method)
{
	typedef void (DEFAULT_CALL *PInvokeFunc) (char*, int32_t);

	// Marshaling of parameter '___imageSavePath0' to native representation
	char* ____imageSavePath0_marshaled = NULL;
	____imageSavePath0_marshaled = il2cpp_codegen_marshal_string(___imageSavePath0);

	// Native function invocation
	reinterpret_cast<PInvokeFunc>(_NativeGallery_PickImage)(____imageSavePath0_marshaled, ___maxSize1);

	// Marshaling cleanup of parameter '___imageSavePath0' native representation
	il2cpp_codegen_marshal_free(____imageSavePath0_marshaled);
	____imageSavePath0_marshaled = NULL;

}
extern "C" void DEFAULT_CALL _NativeGallery_PickVideo();
// System.Void NativeGallery::_NativeGallery_PickVideo()
extern "C"  void NativeGallery__NativeGallery_PickVideo_m2940838827 (RuntimeObject * __this /* static, unused */, const RuntimeMethod* method)
{
	typedef void (DEFAULT_CALL *PInvokeFunc) ();

	// Native function invocation
	reinterpret_cast<PInvokeFunc>(_NativeGallery_PickVideo)();

}
extern "C" char* DEFAULT_CALL _NativeGallery_GetImageProperties(char*);
// System.String NativeGallery::_NativeGallery_GetImageProperties(System.String)
extern "C"  String_t* NativeGallery__NativeGallery_GetImageProperties_m210662476 (RuntimeObject * __this /* static, unused */, String_t* ___path0, const RuntimeMethod* method)
{
	typedef char* (DEFAULT_CALL *PInvokeFunc) (char*);

	// Marshaling of parameter '___path0' to native representation
	char* ____path0_marshaled = NULL;
	____path0_marshaled = il2cpp_codegen_marshal_string(___path0);

	// Native function invocation
	char* returnValue = reinterpret_cast<PInvokeFunc>(_NativeGallery_GetImageProperties)(____path0_marshaled);

	// Marshaling of return value back from native representation
	String_t* _returnValue_unmarshaled = NULL;
	_returnValue_unmarshaled = il2cpp_codegen_marshal_string_result(returnValue);

	// Marshaling cleanup of return value native representation
	il2cpp_codegen_marshal_free(returnValue);
	returnValue = NULL;

	// Marshaling cleanup of parameter '___path0' native representation
	il2cpp_codegen_marshal_free(____path0_marshaled);
	____path0_marshaled = NULL;

	return _returnValue_unmarshaled;
}
extern "C" char* DEFAULT_CALL _NativeGallery_LoadImageAtPath(char*, char*, int32_t);
// System.String NativeGallery::_NativeGallery_LoadImageAtPath(System.String,System.String,System.Int32)
extern "C"  String_t* NativeGallery__NativeGallery_LoadImageAtPath_m570075515 (RuntimeObject * __this /* static, unused */, String_t* ___path0, String_t* ___temporaryFilePath1, int32_t ___maxSize2, const RuntimeMethod* method)
{
	typedef char* (DEFAULT_CALL *PInvokeFunc) (char*, char*, int32_t);

	// Marshaling of parameter '___path0' to native representation
	char* ____path0_marshaled = NULL;
	____path0_marshaled = il2cpp_codegen_marshal_string(___path0);

	// Marshaling of parameter '___temporaryFilePath1' to native representation
	char* ____temporaryFilePath1_marshaled = NULL;
	____temporaryFilePath1_marshaled = il2cpp_codegen_marshal_string(___temporaryFilePath1);

	// Native function invocation
	char* returnValue = reinterpret_cast<PInvokeFunc>(_NativeGallery_LoadImageAtPath)(____path0_marshaled, ____temporaryFilePath1_marshaled, ___maxSize2);

	// Marshaling of return value back from native representation
	String_t* _returnValue_unmarshaled = NULL;
	_returnValue_unmarshaled = il2cpp_codegen_marshal_string_result(returnValue);

	// Marshaling cleanup of return value native representation
	il2cpp_codegen_marshal_free(returnValue);
	returnValue = NULL;

	// Marshaling cleanup of parameter '___path0' native representation
	il2cpp_codegen_marshal_free(____path0_marshaled);
	____path0_marshaled = NULL;

	// Marshaling cleanup of parameter '___temporaryFilePath1' native representation
	il2cpp_codegen_marshal_free(____temporaryFilePath1_marshaled);
	____temporaryFilePath1_marshaled = NULL;

	return _returnValue_unmarshaled;
}
// System.String NativeGallery::get_TemporaryImagePath()
extern "C"  String_t* NativeGallery_get_TemporaryImagePath_m1358311393 (RuntimeObject * __this /* static, unused */, const RuntimeMethod* method)
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_method (NativeGallery_get_TemporaryImagePath_m1358311393_MetadataUsageId);
		s_Il2CppMethodInitialized = true;
	}
	{
		IL2CPP_RUNTIME_CLASS_INIT(NativeGallery_t2808515514_il2cpp_TypeInfo_var);
		String_t* L_0 = ((NativeGallery_t2808515514_StaticFields*)il2cpp_codegen_static_fields_for(NativeGallery_t2808515514_il2cpp_TypeInfo_var))->get_m_temporaryImagePath_0();
		if (L_0)
		{
			goto IL_0029;
		}
	}
	{
		String_t* L_1 = Application_get_temporaryCachePath_m1214546342(NULL /*static, unused*/, /*hidden argument*/NULL);
		IL2CPP_RUNTIME_CLASS_INIT(Path_t1605229823_il2cpp_TypeInfo_var);
		String_t* L_2 = Path_Combine_m3389272516(NULL /*static, unused*/, L_1, _stringLiteral1392880498, /*hidden argument*/NULL);
		IL2CPP_RUNTIME_CLASS_INIT(NativeGallery_t2808515514_il2cpp_TypeInfo_var);
		((NativeGallery_t2808515514_StaticFields*)il2cpp_codegen_static_fields_for(NativeGallery_t2808515514_il2cpp_TypeInfo_var))->set_m_temporaryImagePath_0(L_2);
		String_t* L_3 = Application_get_temporaryCachePath_m1214546342(NULL /*static, unused*/, /*hidden argument*/NULL);
		Directory_CreateDirectory_m751642867(NULL /*static, unused*/, L_3, /*hidden argument*/NULL);
	}

IL_0029:
	{
		IL2CPP_RUNTIME_CLASS_INIT(NativeGallery_t2808515514_il2cpp_TypeInfo_var);
		String_t* L_4 = ((NativeGallery_t2808515514_StaticFields*)il2cpp_codegen_static_fields_for(NativeGallery_t2808515514_il2cpp_TypeInfo_var))->get_m_temporaryImagePath_0();
		return L_4;
	}
}
// System.String NativeGallery::get_IOSSelectedImagePath()
extern "C"  String_t* NativeGallery_get_IOSSelectedImagePath_m2691245459 (RuntimeObject * __this /* static, unused */, const RuntimeMethod* method)
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_method (NativeGallery_get_IOSSelectedImagePath_m2691245459_MetadataUsageId);
		s_Il2CppMethodInitialized = true;
	}
	{
		IL2CPP_RUNTIME_CLASS_INIT(NativeGallery_t2808515514_il2cpp_TypeInfo_var);
		String_t* L_0 = ((NativeGallery_t2808515514_StaticFields*)il2cpp_codegen_static_fields_for(NativeGallery_t2808515514_il2cpp_TypeInfo_var))->get_m_iOSSelectedImagePath_1();
		if (L_0)
		{
			goto IL_0029;
		}
	}
	{
		String_t* L_1 = Application_get_temporaryCachePath_m1214546342(NULL /*static, unused*/, /*hidden argument*/NULL);
		IL2CPP_RUNTIME_CLASS_INIT(Path_t1605229823_il2cpp_TypeInfo_var);
		String_t* L_2 = Path_Combine_m3389272516(NULL /*static, unused*/, L_1, _stringLiteral2649333259, /*hidden argument*/NULL);
		IL2CPP_RUNTIME_CLASS_INIT(NativeGallery_t2808515514_il2cpp_TypeInfo_var);
		((NativeGallery_t2808515514_StaticFields*)il2cpp_codegen_static_fields_for(NativeGallery_t2808515514_il2cpp_TypeInfo_var))->set_m_iOSSelectedImagePath_1(L_2);
		String_t* L_3 = Application_get_temporaryCachePath_m1214546342(NULL /*static, unused*/, /*hidden argument*/NULL);
		Directory_CreateDirectory_m751642867(NULL /*static, unused*/, L_3, /*hidden argument*/NULL);
	}

IL_0029:
	{
		IL2CPP_RUNTIME_CLASS_INIT(NativeGallery_t2808515514_il2cpp_TypeInfo_var);
		String_t* L_4 = ((NativeGallery_t2808515514_StaticFields*)il2cpp_codegen_static_fields_for(NativeGallery_t2808515514_il2cpp_TypeInfo_var))->get_m_iOSSelectedImagePath_1();
		return L_4;
	}
}
// NativeGallery/Permission NativeGallery::CheckPermission()
extern "C"  int32_t NativeGallery_CheckPermission_m1786438771 (RuntimeObject * __this /* static, unused */, const RuntimeMethod* method)
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_method (NativeGallery_CheckPermission_m1786438771_MetadataUsageId);
		s_Il2CppMethodInitialized = true;
	}
	{
		IL2CPP_RUNTIME_CLASS_INIT(NativeGallery_t2808515514_il2cpp_TypeInfo_var);
		int32_t L_0 = NativeGallery__NativeGallery_CheckPermission_m2442021883(NULL /*static, unused*/, /*hidden argument*/NULL);
		return (int32_t)(L_0);
	}
}
// NativeGallery/Permission NativeGallery::RequestPermission()
extern "C"  int32_t NativeGallery_RequestPermission_m3085250992 (RuntimeObject * __this /* static, unused */, const RuntimeMethod* method)
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_method (NativeGallery_RequestPermission_m3085250992_MetadataUsageId);
		s_Il2CppMethodInitialized = true;
	}
	{
		IL2CPP_RUNTIME_CLASS_INIT(NativeGallery_t2808515514_il2cpp_TypeInfo_var);
		int32_t L_0 = NativeGallery__NativeGallery_RequestPermission_m3800542249(NULL /*static, unused*/, /*hidden argument*/NULL);
		return (int32_t)(L_0);
	}
}
// System.Boolean NativeGallery::CanOpenSettings()
extern "C"  bool NativeGallery_CanOpenSettings_m2865431573 (RuntimeObject * __this /* static, unused */, const RuntimeMethod* method)
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_method (NativeGallery_CanOpenSettings_m2865431573_MetadataUsageId);
		s_Il2CppMethodInitialized = true;
	}
	{
		IL2CPP_RUNTIME_CLASS_INIT(NativeGallery_t2808515514_il2cpp_TypeInfo_var);
		int32_t L_0 = NativeGallery__NativeGallery_CanOpenSettings_m589168296(NULL /*static, unused*/, /*hidden argument*/NULL);
		return (bool)((((int32_t)L_0) == ((int32_t)1))? 1 : 0);
	}
}
// System.Void NativeGallery::OpenSettings()
extern "C"  void NativeGallery_OpenSettings_m2073715281 (RuntimeObject * __this /* static, unused */, const RuntimeMethod* method)
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_method (NativeGallery_OpenSettings_m2073715281_MetadataUsageId);
		s_Il2CppMethodInitialized = true;
	}
	{
		IL2CPP_RUNTIME_CLASS_INIT(NativeGallery_t2808515514_il2cpp_TypeInfo_var);
		NativeGallery__NativeGallery_OpenSettings_m1115625722(NULL /*static, unused*/, /*hidden argument*/NULL);
		return;
	}
}
// NativeGallery/Permission NativeGallery::SaveImageToGallery(System.Byte[],System.String,System.String,NativeGallery/MediaSaveCallback)
extern "C"  int32_t NativeGallery_SaveImageToGallery_m3348418455 (RuntimeObject * __this /* static, unused */, ByteU5BU5D_t4116647657* ___mediaBytes0, String_t* ___album1, String_t* ___filenameFormatted2, MediaSaveCallback_t1711154875 * ___callback3, const RuntimeMethod* method)
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_method (NativeGallery_SaveImageToGallery_m3348418455_MetadataUsageId);
		s_Il2CppMethodInitialized = true;
	}
	{
		ByteU5BU5D_t4116647657* L_0 = ___mediaBytes0;
		String_t* L_1 = ___album1;
		String_t* L_2 = ___filenameFormatted2;
		MediaSaveCallback_t1711154875 * L_3 = ___callback3;
		IL2CPP_RUNTIME_CLASS_INIT(NativeGallery_t2808515514_il2cpp_TypeInfo_var);
		int32_t L_4 = NativeGallery_SaveToGallery_m3366416885(NULL /*static, unused*/, L_0, L_1, L_2, (bool)1, L_3, /*hidden argument*/NULL);
		return L_4;
	}
}
// NativeGallery/Permission NativeGallery::SaveImageToGallery(System.String,System.String,System.String,NativeGallery/MediaSaveCallback)
extern "C"  int32_t NativeGallery_SaveImageToGallery_m2353988206 (RuntimeObject * __this /* static, unused */, String_t* ___existingMediaPath0, String_t* ___album1, String_t* ___filenameFormatted2, MediaSaveCallback_t1711154875 * ___callback3, const RuntimeMethod* method)
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_method (NativeGallery_SaveImageToGallery_m2353988206_MetadataUsageId);
		s_Il2CppMethodInitialized = true;
	}
	{
		String_t* L_0 = ___existingMediaPath0;
		String_t* L_1 = ___album1;
		String_t* L_2 = ___filenameFormatted2;
		MediaSaveCallback_t1711154875 * L_3 = ___callback3;
		IL2CPP_RUNTIME_CLASS_INIT(NativeGallery_t2808515514_il2cpp_TypeInfo_var);
		int32_t L_4 = NativeGallery_SaveToGallery_m4000209401(NULL /*static, unused*/, L_0, L_1, L_2, (bool)1, L_3, /*hidden argument*/NULL);
		return L_4;
	}
}
// NativeGallery/Permission NativeGallery::SaveImageToGallery(UnityEngine.Texture2D,System.String,System.String,NativeGallery/MediaSaveCallback)
extern "C"  int32_t NativeGallery_SaveImageToGallery_m1342837694 (RuntimeObject * __this /* static, unused */, Texture2D_t3840446185 * ___image0, String_t* ___album1, String_t* ___filenameFormatted2, MediaSaveCallback_t1711154875 * ___callback3, const RuntimeMethod* method)
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_method (NativeGallery_SaveImageToGallery_m1342837694_MetadataUsageId);
		s_Il2CppMethodInitialized = true;
	}
	{
		Texture2D_t3840446185 * L_0 = ___image0;
		IL2CPP_RUNTIME_CLASS_INIT(Object_t631007953_il2cpp_TypeInfo_var);
		bool L_1 = Object_op_Equality_m1810815630(NULL /*static, unused*/, L_0, (Object_t631007953 *)NULL, /*hidden argument*/NULL);
		if (!L_1)
		{
			goto IL_0017;
		}
	}
	{
		ArgumentException_t132251570 * L_2 = (ArgumentException_t132251570 *)il2cpp_codegen_object_new(ArgumentException_t132251570_il2cpp_TypeInfo_var);
		ArgumentException__ctor_m1312628991(L_2, _stringLiteral563961164, /*hidden argument*/NULL);
		IL2CPP_RAISE_MANAGED_EXCEPTION(L_2, NULL, NativeGallery_SaveImageToGallery_m1342837694_RuntimeMethod_var);
	}

IL_0017:
	{
		String_t* L_3 = ___filenameFormatted2;
		NullCheck(L_3);
		bool L_4 = String_EndsWith_m1901926500(L_3, _stringLiteral2063196619, /*hidden argument*/NULL);
		if (L_4)
		{
			goto IL_0037;
		}
	}
	{
		String_t* L_5 = ___filenameFormatted2;
		NullCheck(L_5);
		bool L_6 = String_EndsWith_m1901926500(L_5, _stringLiteral2860068956, /*hidden argument*/NULL);
		if (!L_6)
		{
			goto IL_0049;
		}
	}

IL_0037:
	{
		Texture2D_t3840446185 * L_7 = ___image0;
		ByteU5BU5D_t4116647657* L_8 = ImageConversion_EncodeToJPG_m2489668130(NULL /*static, unused*/, L_7, ((int32_t)100), /*hidden argument*/NULL);
		String_t* L_9 = ___album1;
		String_t* L_10 = ___filenameFormatted2;
		MediaSaveCallback_t1711154875 * L_11 = ___callback3;
		IL2CPP_RUNTIME_CLASS_INIT(NativeGallery_t2808515514_il2cpp_TypeInfo_var);
		int32_t L_12 = NativeGallery_SaveToGallery_m3366416885(NULL /*static, unused*/, L_8, L_9, L_10, (bool)1, L_11, /*hidden argument*/NULL);
		return L_12;
	}

IL_0049:
	{
		String_t* L_13 = ___filenameFormatted2;
		NullCheck(L_13);
		bool L_14 = String_EndsWith_m1901926500(L_13, _stringLiteral2410385622, /*hidden argument*/NULL);
		if (!L_14)
		{
			goto IL_0069;
		}
	}
	{
		Texture2D_t3840446185 * L_15 = ___image0;
		ByteU5BU5D_t4116647657* L_16 = ImageConversion_EncodeToPNG_m2292631531(NULL /*static, unused*/, L_15, /*hidden argument*/NULL);
		String_t* L_17 = ___album1;
		String_t* L_18 = ___filenameFormatted2;
		MediaSaveCallback_t1711154875 * L_19 = ___callback3;
		IL2CPP_RUNTIME_CLASS_INIT(NativeGallery_t2808515514_il2cpp_TypeInfo_var);
		int32_t L_20 = NativeGallery_SaveToGallery_m3366416885(NULL /*static, unused*/, L_16, L_17, L_18, (bool)1, L_19, /*hidden argument*/NULL);
		return L_20;
	}

IL_0069:
	{
		Texture2D_t3840446185 * L_21 = ___image0;
		ByteU5BU5D_t4116647657* L_22 = ImageConversion_EncodeToPNG_m2292631531(NULL /*static, unused*/, L_21, /*hidden argument*/NULL);
		String_t* L_23 = ___album1;
		String_t* L_24 = ___filenameFormatted2;
		IL2CPP_RUNTIME_CLASS_INIT(String_t_il2cpp_TypeInfo_var);
		String_t* L_25 = String_Concat_m3937257545(NULL /*static, unused*/, L_24, _stringLiteral2410385622, /*hidden argument*/NULL);
		MediaSaveCallback_t1711154875 * L_26 = ___callback3;
		IL2CPP_RUNTIME_CLASS_INIT(NativeGallery_t2808515514_il2cpp_TypeInfo_var);
		int32_t L_27 = NativeGallery_SaveToGallery_m3366416885(NULL /*static, unused*/, L_22, L_23, L_25, (bool)1, L_26, /*hidden argument*/NULL);
		return L_27;
	}
}
// NativeGallery/Permission NativeGallery::SaveVideoToGallery(System.Byte[],System.String,System.String,NativeGallery/MediaSaveCallback)
extern "C"  int32_t NativeGallery_SaveVideoToGallery_m3473076284 (RuntimeObject * __this /* static, unused */, ByteU5BU5D_t4116647657* ___mediaBytes0, String_t* ___album1, String_t* ___filenameFormatted2, MediaSaveCallback_t1711154875 * ___callback3, const RuntimeMethod* method)
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_method (NativeGallery_SaveVideoToGallery_m3473076284_MetadataUsageId);
		s_Il2CppMethodInitialized = true;
	}
	{
		ByteU5BU5D_t4116647657* L_0 = ___mediaBytes0;
		String_t* L_1 = ___album1;
		String_t* L_2 = ___filenameFormatted2;
		MediaSaveCallback_t1711154875 * L_3 = ___callback3;
		IL2CPP_RUNTIME_CLASS_INIT(NativeGallery_t2808515514_il2cpp_TypeInfo_var);
		int32_t L_4 = NativeGallery_SaveToGallery_m3366416885(NULL /*static, unused*/, L_0, L_1, L_2, (bool)0, L_3, /*hidden argument*/NULL);
		return L_4;
	}
}
// NativeGallery/Permission NativeGallery::SaveVideoToGallery(System.String,System.String,System.String,NativeGallery/MediaSaveCallback)
extern "C"  int32_t NativeGallery_SaveVideoToGallery_m2509233189 (RuntimeObject * __this /* static, unused */, String_t* ___existingMediaPath0, String_t* ___album1, String_t* ___filenameFormatted2, MediaSaveCallback_t1711154875 * ___callback3, const RuntimeMethod* method)
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_method (NativeGallery_SaveVideoToGallery_m2509233189_MetadataUsageId);
		s_Il2CppMethodInitialized = true;
	}
	{
		String_t* L_0 = ___existingMediaPath0;
		String_t* L_1 = ___album1;
		String_t* L_2 = ___filenameFormatted2;
		MediaSaveCallback_t1711154875 * L_3 = ___callback3;
		IL2CPP_RUNTIME_CLASS_INIT(NativeGallery_t2808515514_il2cpp_TypeInfo_var);
		int32_t L_4 = NativeGallery_SaveToGallery_m4000209401(NULL /*static, unused*/, L_0, L_1, L_2, (bool)0, L_3, /*hidden argument*/NULL);
		return L_4;
	}
}
// System.Boolean NativeGallery::CanSelectMultipleFilesFromGallery()
extern "C"  bool NativeGallery_CanSelectMultipleFilesFromGallery_m1434233298 (RuntimeObject * __this /* static, unused */, const RuntimeMethod* method)
{
	{
		return (bool)0;
	}
}
// NativeGallery/Permission NativeGallery::GetImageFromGallery(NativeGallery/MediaPickCallback,System.String,System.String,System.Int32)
extern "C"  int32_t NativeGallery_GetImageFromGallery_m775556130 (RuntimeObject * __this /* static, unused */, MediaPickCallback_t2468098299 * ___callback0, String_t* ___title1, String_t* ___mime2, int32_t ___maxSize3, const RuntimeMethod* method)
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_method (NativeGallery_GetImageFromGallery_m775556130_MetadataUsageId);
		s_Il2CppMethodInitialized = true;
	}
	{
		MediaPickCallback_t2468098299 * L_0 = ___callback0;
		String_t* L_1 = ___mime2;
		String_t* L_2 = ___title1;
		int32_t L_3 = ___maxSize3;
		IL2CPP_RUNTIME_CLASS_INIT(NativeGallery_t2808515514_il2cpp_TypeInfo_var);
		int32_t L_4 = NativeGallery_GetMediaFromGallery_m2807044920(NULL /*static, unused*/, L_0, (bool)1, L_1, L_2, L_3, /*hidden argument*/NULL);
		return L_4;
	}
}
// NativeGallery/Permission NativeGallery::GetVideoFromGallery(NativeGallery/MediaPickCallback,System.String,System.String)
extern "C"  int32_t NativeGallery_GetVideoFromGallery_m3000217725 (RuntimeObject * __this /* static, unused */, MediaPickCallback_t2468098299 * ___callback0, String_t* ___title1, String_t* ___mime2, const RuntimeMethod* method)
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_method (NativeGallery_GetVideoFromGallery_m3000217725_MetadataUsageId);
		s_Il2CppMethodInitialized = true;
	}
	{
		MediaPickCallback_t2468098299 * L_0 = ___callback0;
		String_t* L_1 = ___mime2;
		String_t* L_2 = ___title1;
		IL2CPP_RUNTIME_CLASS_INIT(NativeGallery_t2808515514_il2cpp_TypeInfo_var);
		int32_t L_3 = NativeGallery_GetMediaFromGallery_m2807044920(NULL /*static, unused*/, L_0, (bool)0, L_1, L_2, (-1), /*hidden argument*/NULL);
		return L_3;
	}
}
// NativeGallery/Permission NativeGallery::GetImagesFromGallery(NativeGallery/MediaPickMultipleCallback,System.String,System.String,System.Int32)
extern "C"  int32_t NativeGallery_GetImagesFromGallery_m3043034140 (RuntimeObject * __this /* static, unused */, MediaPickMultipleCallback_t2483155519 * ___callback0, String_t* ___title1, String_t* ___mime2, int32_t ___maxSize3, const RuntimeMethod* method)
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_method (NativeGallery_GetImagesFromGallery_m3043034140_MetadataUsageId);
		s_Il2CppMethodInitialized = true;
	}
	{
		MediaPickMultipleCallback_t2483155519 * L_0 = ___callback0;
		String_t* L_1 = ___mime2;
		String_t* L_2 = ___title1;
		int32_t L_3 = ___maxSize3;
		IL2CPP_RUNTIME_CLASS_INIT(NativeGallery_t2808515514_il2cpp_TypeInfo_var);
		int32_t L_4 = NativeGallery_GetMultipleMediaFromGallery_m1977049241(NULL /*static, unused*/, L_0, (bool)1, L_1, L_2, L_3, /*hidden argument*/NULL);
		return L_4;
	}
}
// NativeGallery/Permission NativeGallery::GetVideosFromGallery(NativeGallery/MediaPickMultipleCallback,System.String,System.String)
extern "C"  int32_t NativeGallery_GetVideosFromGallery_m134385912 (RuntimeObject * __this /* static, unused */, MediaPickMultipleCallback_t2483155519 * ___callback0, String_t* ___title1, String_t* ___mime2, const RuntimeMethod* method)
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_method (NativeGallery_GetVideosFromGallery_m134385912_MetadataUsageId);
		s_Il2CppMethodInitialized = true;
	}
	{
		MediaPickMultipleCallback_t2483155519 * L_0 = ___callback0;
		String_t* L_1 = ___mime2;
		String_t* L_2 = ___title1;
		IL2CPP_RUNTIME_CLASS_INIT(NativeGallery_t2808515514_il2cpp_TypeInfo_var);
		int32_t L_3 = NativeGallery_GetMultipleMediaFromGallery_m1977049241(NULL /*static, unused*/, L_0, (bool)0, L_1, L_2, (-1), /*hidden argument*/NULL);
		return L_3;
	}
}
// System.Boolean NativeGallery::IsMediaPickerBusy()
extern "C"  bool NativeGallery_IsMediaPickerBusy_m3841585438 (RuntimeObject * __this /* static, unused */, const RuntimeMethod* method)
{
	{
		bool L_0 = NGMediaReceiveCallbackiOS_get_IsBusy_m4210058844(NULL /*static, unused*/, /*hidden argument*/NULL);
		return L_0;
	}
}
// NativeGallery/Permission NativeGallery::SaveToGallery(System.Byte[],System.String,System.String,System.Boolean,NativeGallery/MediaSaveCallback)
extern "C"  int32_t NativeGallery_SaveToGallery_m3366416885 (RuntimeObject * __this /* static, unused */, ByteU5BU5D_t4116647657* ___mediaBytes0, String_t* ___album1, String_t* ___filenameFormatted2, bool ___isImage3, MediaSaveCallback_t1711154875 * ___callback4, const RuntimeMethod* method)
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_method (NativeGallery_SaveToGallery_m3366416885_MetadataUsageId);
		s_Il2CppMethodInitialized = true;
	}
	int32_t V_0 = 0;
	String_t* V_1 = NULL;
	{
		IL2CPP_RUNTIME_CLASS_INIT(NativeGallery_t2808515514_il2cpp_TypeInfo_var);
		int32_t L_0 = NativeGallery_RequestPermission_m3085250992(NULL /*static, unused*/, /*hidden argument*/NULL);
		V_0 = L_0;
		int32_t L_1 = V_0;
		if ((!(((uint32_t)L_1) == ((uint32_t)1))))
		{
			goto IL_0077;
		}
	}
	{
		ByteU5BU5D_t4116647657* L_2 = ___mediaBytes0;
		if (!L_2)
		{
			goto IL_001b;
		}
	}
	{
		ByteU5BU5D_t4116647657* L_3 = ___mediaBytes0;
		NullCheck(L_3);
		if ((((int32_t)((int32_t)(((RuntimeArray *)L_3)->max_length)))))
		{
			goto IL_0026;
		}
	}

IL_001b:
	{
		ArgumentException_t132251570 * L_4 = (ArgumentException_t132251570 *)il2cpp_codegen_object_new(ArgumentException_t132251570_il2cpp_TypeInfo_var);
		ArgumentException__ctor_m1312628991(L_4, _stringLiteral1212739322, /*hidden argument*/NULL);
		IL2CPP_RAISE_MANAGED_EXCEPTION(L_4, NULL, NativeGallery_SaveToGallery_m3366416885_RuntimeMethod_var);
	}

IL_0026:
	{
		String_t* L_5 = ___album1;
		if (!L_5)
		{
			goto IL_0037;
		}
	}
	{
		String_t* L_6 = ___album1;
		NullCheck(L_6);
		int32_t L_7 = String_get_Length_m3847582255(L_6, /*hidden argument*/NULL);
		if (L_7)
		{
			goto IL_0042;
		}
	}

IL_0037:
	{
		ArgumentException_t132251570 * L_8 = (ArgumentException_t132251570 *)il2cpp_codegen_object_new(ArgumentException_t132251570_il2cpp_TypeInfo_var);
		ArgumentException__ctor_m1312628991(L_8, _stringLiteral2755812117, /*hidden argument*/NULL);
		IL2CPP_RAISE_MANAGED_EXCEPTION(L_8, NULL, NativeGallery_SaveToGallery_m3366416885_RuntimeMethod_var);
	}

IL_0042:
	{
		String_t* L_9 = ___filenameFormatted2;
		if (!L_9)
		{
			goto IL_0053;
		}
	}
	{
		String_t* L_10 = ___filenameFormatted2;
		NullCheck(L_10);
		int32_t L_11 = String_get_Length_m3847582255(L_10, /*hidden argument*/NULL);
		if (L_11)
		{
			goto IL_005e;
		}
	}

IL_0053:
	{
		ArgumentException_t132251570 * L_12 = (ArgumentException_t132251570 *)il2cpp_codegen_object_new(ArgumentException_t132251570_il2cpp_TypeInfo_var);
		ArgumentException__ctor_m1312628991(L_12, _stringLiteral1041934514, /*hidden argument*/NULL);
		IL2CPP_RAISE_MANAGED_EXCEPTION(L_12, NULL, NativeGallery_SaveToGallery_m3366416885_RuntimeMethod_var);
	}

IL_005e:
	{
		String_t* L_13 = ___album1;
		String_t* L_14 = ___filenameFormatted2;
		IL2CPP_RUNTIME_CLASS_INIT(NativeGallery_t2808515514_il2cpp_TypeInfo_var);
		String_t* L_15 = NativeGallery_GetSavePath_m938747003(NULL /*static, unused*/, L_13, L_14, /*hidden argument*/NULL);
		V_1 = L_15;
		String_t* L_16 = V_1;
		ByteU5BU5D_t4116647657* L_17 = ___mediaBytes0;
		File_WriteAllBytes_m4252682105(NULL /*static, unused*/, L_16, L_17, /*hidden argument*/NULL);
		String_t* L_18 = V_1;
		String_t* L_19 = ___album1;
		bool L_20 = ___isImage3;
		MediaSaveCallback_t1711154875 * L_21 = ___callback4;
		NativeGallery_SaveToGalleryInternal_m2106641(NULL /*static, unused*/, L_18, L_19, L_20, L_21, /*hidden argument*/NULL);
	}

IL_0077:
	{
		int32_t L_22 = V_0;
		return L_22;
	}
}
// NativeGallery/Permission NativeGallery::SaveToGallery(System.String,System.String,System.String,System.Boolean,NativeGallery/MediaSaveCallback)
extern "C"  int32_t NativeGallery_SaveToGallery_m4000209401 (RuntimeObject * __this /* static, unused */, String_t* ___existingMediaPath0, String_t* ___album1, String_t* ___filenameFormatted2, bool ___isImage3, MediaSaveCallback_t1711154875 * ___callback4, const RuntimeMethod* method)
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_method (NativeGallery_SaveToGallery_m4000209401_MetadataUsageId);
		s_Il2CppMethodInitialized = true;
	}
	int32_t V_0 = 0;
	String_t* V_1 = NULL;
	{
		IL2CPP_RUNTIME_CLASS_INIT(NativeGallery_t2808515514_il2cpp_TypeInfo_var);
		int32_t L_0 = NativeGallery_RequestPermission_m3085250992(NULL /*static, unused*/, /*hidden argument*/NULL);
		V_0 = L_0;
		int32_t L_1 = V_0;
		if ((!(((uint32_t)L_1) == ((uint32_t)1))))
		{
			goto IL_007b;
		}
	}
	{
		String_t* L_2 = ___existingMediaPath0;
		bool L_3 = File_Exists_m3943585060(NULL /*static, unused*/, L_2, /*hidden argument*/NULL);
		if (L_3)
		{
			goto IL_0029;
		}
	}
	{
		String_t* L_4 = ___existingMediaPath0;
		IL2CPP_RUNTIME_CLASS_INIT(String_t_il2cpp_TypeInfo_var);
		String_t* L_5 = String_Concat_m3937257545(NULL /*static, unused*/, _stringLiteral1685319404, L_4, /*hidden argument*/NULL);
		FileNotFoundException_t225391025 * L_6 = (FileNotFoundException_t225391025 *)il2cpp_codegen_object_new(FileNotFoundException_t225391025_il2cpp_TypeInfo_var);
		FileNotFoundException__ctor_m3252664930(L_6, L_5, /*hidden argument*/NULL);
		IL2CPP_RAISE_MANAGED_EXCEPTION(L_6, NULL, NativeGallery_SaveToGallery_m4000209401_RuntimeMethod_var);
	}

IL_0029:
	{
		String_t* L_7 = ___album1;
		if (!L_7)
		{
			goto IL_003a;
		}
	}
	{
		String_t* L_8 = ___album1;
		NullCheck(L_8);
		int32_t L_9 = String_get_Length_m3847582255(L_8, /*hidden argument*/NULL);
		if (L_9)
		{
			goto IL_0045;
		}
	}

IL_003a:
	{
		ArgumentException_t132251570 * L_10 = (ArgumentException_t132251570 *)il2cpp_codegen_object_new(ArgumentException_t132251570_il2cpp_TypeInfo_var);
		ArgumentException__ctor_m1312628991(L_10, _stringLiteral2755812117, /*hidden argument*/NULL);
		IL2CPP_RAISE_MANAGED_EXCEPTION(L_10, NULL, NativeGallery_SaveToGallery_m4000209401_RuntimeMethod_var);
	}

IL_0045:
	{
		String_t* L_11 = ___filenameFormatted2;
		if (!L_11)
		{
			goto IL_0056;
		}
	}
	{
		String_t* L_12 = ___filenameFormatted2;
		NullCheck(L_12);
		int32_t L_13 = String_get_Length_m3847582255(L_12, /*hidden argument*/NULL);
		if (L_13)
		{
			goto IL_0061;
		}
	}

IL_0056:
	{
		ArgumentException_t132251570 * L_14 = (ArgumentException_t132251570 *)il2cpp_codegen_object_new(ArgumentException_t132251570_il2cpp_TypeInfo_var);
		ArgumentException__ctor_m1312628991(L_14, _stringLiteral1041934514, /*hidden argument*/NULL);
		IL2CPP_RAISE_MANAGED_EXCEPTION(L_14, NULL, NativeGallery_SaveToGallery_m4000209401_RuntimeMethod_var);
	}

IL_0061:
	{
		String_t* L_15 = ___album1;
		String_t* L_16 = ___filenameFormatted2;
		IL2CPP_RUNTIME_CLASS_INIT(NativeGallery_t2808515514_il2cpp_TypeInfo_var);
		String_t* L_17 = NativeGallery_GetSavePath_m938747003(NULL /*static, unused*/, L_15, L_16, /*hidden argument*/NULL);
		V_1 = L_17;
		String_t* L_18 = ___existingMediaPath0;
		String_t* L_19 = V_1;
		File_Copy_m3433232803(NULL /*static, unused*/, L_18, L_19, (bool)1, /*hidden argument*/NULL);
		String_t* L_20 = V_1;
		String_t* L_21 = ___album1;
		bool L_22 = ___isImage3;
		MediaSaveCallback_t1711154875 * L_23 = ___callback4;
		NativeGallery_SaveToGalleryInternal_m2106641(NULL /*static, unused*/, L_20, L_21, L_22, L_23, /*hidden argument*/NULL);
	}

IL_007b:
	{
		int32_t L_24 = V_0;
		return L_24;
	}
}
// System.Void NativeGallery::SaveToGalleryInternal(System.String,System.String,System.Boolean,NativeGallery/MediaSaveCallback)
extern "C"  void NativeGallery_SaveToGalleryInternal_m2106641 (RuntimeObject * __this /* static, unused */, String_t* ___path0, String_t* ___album1, bool ___isImage2, MediaSaveCallback_t1711154875 * ___callback3, const RuntimeMethod* method)
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_method (NativeGallery_SaveToGalleryInternal_m2106641_MetadataUsageId);
		s_Il2CppMethodInitialized = true;
	}
	{
		MediaSaveCallback_t1711154875 * L_0 = ___callback3;
		NGMediaSaveCallbackiOS_Initialize_m3647472094(NULL /*static, unused*/, L_0, /*hidden argument*/NULL);
		bool L_1 = ___isImage2;
		if (!L_1)
		{
			goto IL_0018;
		}
	}
	{
		String_t* L_2 = ___path0;
		String_t* L_3 = ___album1;
		IL2CPP_RUNTIME_CLASS_INIT(NativeGallery_t2808515514_il2cpp_TypeInfo_var);
		NativeGallery__NativeGallery_ImageWriteToAlbum_m3596037857(NULL /*static, unused*/, L_2, L_3, /*hidden argument*/NULL);
		goto IL_001f;
	}

IL_0018:
	{
		String_t* L_4 = ___path0;
		String_t* L_5 = ___album1;
		IL2CPP_RUNTIME_CLASS_INIT(NativeGallery_t2808515514_il2cpp_TypeInfo_var);
		NativeGallery__NativeGallery_VideoWriteToAlbum_m4166028978(NULL /*static, unused*/, L_4, L_5, /*hidden argument*/NULL);
	}

IL_001f:
	{
		String_t* L_6 = ___path0;
		IL2CPP_RUNTIME_CLASS_INIT(Path_t1605229823_il2cpp_TypeInfo_var);
		String_t* L_7 = Path_GetFileName_m1354558116(NULL /*static, unused*/, L_6, /*hidden argument*/NULL);
		IL2CPP_RUNTIME_CLASS_INIT(String_t_il2cpp_TypeInfo_var);
		String_t* L_8 = String_Concat_m3937257545(NULL /*static, unused*/, _stringLiteral2894507939, L_7, /*hidden argument*/NULL);
		IL2CPP_RUNTIME_CLASS_INIT(Debug_t3317548046_il2cpp_TypeInfo_var);
		Debug_Log_m4051431634(NULL /*static, unused*/, L_8, /*hidden argument*/NULL);
		return;
	}
}
// System.String NativeGallery::GetSavePath(System.String,System.String)
extern "C"  String_t* NativeGallery_GetSavePath_m938747003 (RuntimeObject * __this /* static, unused */, String_t* ___album0, String_t* ___filenameFormatted1, const RuntimeMethod* method)
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_method (NativeGallery_GetSavePath_m938747003_MetadataUsageId);
		s_Il2CppMethodInitialized = true;
	}
	String_t* V_0 = NULL;
	int32_t V_1 = 0;
	String_t* V_2 = NULL;
	{
		String_t* L_0 = Application_get_persistentDataPath_m1428108154(NULL /*static, unused*/, /*hidden argument*/NULL);
		V_0 = L_0;
		String_t* L_1 = ___filenameFormatted1;
		NullCheck(L_1);
		bool L_2 = String_Contains_m1147431944(L_1, _stringLiteral628085470, /*hidden argument*/NULL);
		if (!L_2)
		{
			goto IL_003c;
		}
	}
	{
		V_1 = 0;
	}

IL_0018:
	{
		String_t* L_3 = V_0;
		String_t* L_4 = ___filenameFormatted1;
		int32_t L_5 = V_1;
		int32_t L_6 = ((int32_t)il2cpp_codegen_add((int32_t)L_5, (int32_t)1));
		V_1 = L_6;
		int32_t L_7 = L_6;
		RuntimeObject * L_8 = Box(Int32_t2950945753_il2cpp_TypeInfo_var, &L_7);
		IL2CPP_RUNTIME_CLASS_INIT(String_t_il2cpp_TypeInfo_var);
		String_t* L_9 = String_Format_m2844511972(NULL /*static, unused*/, L_4, L_8, /*hidden argument*/NULL);
		IL2CPP_RUNTIME_CLASS_INIT(Path_t1605229823_il2cpp_TypeInfo_var);
		String_t* L_10 = Path_Combine_m3389272516(NULL /*static, unused*/, L_3, L_9, /*hidden argument*/NULL);
		V_2 = L_10;
		String_t* L_11 = V_2;
		bool L_12 = File_Exists_m3943585060(NULL /*static, unused*/, L_11, /*hidden argument*/NULL);
		if (L_12)
		{
			goto IL_0018;
		}
	}
	{
		String_t* L_13 = V_2;
		return L_13;
	}

IL_003c:
	{
		String_t* L_14 = V_0;
		String_t* L_15 = ___filenameFormatted1;
		IL2CPP_RUNTIME_CLASS_INIT(Path_t1605229823_il2cpp_TypeInfo_var);
		String_t* L_16 = Path_Combine_m3389272516(NULL /*static, unused*/, L_14, L_15, /*hidden argument*/NULL);
		V_0 = L_16;
		String_t* L_17 = V_0;
		bool L_18 = File_Exists_m3943585060(NULL /*static, unused*/, L_17, /*hidden argument*/NULL);
		if (!L_18)
		{
			goto IL_006c;
		}
	}
	{
		String_t* L_19 = ___album0;
		String_t* L_20 = ___filenameFormatted1;
		IL2CPP_RUNTIME_CLASS_INIT(Path_t1605229823_il2cpp_TypeInfo_var);
		String_t* L_21 = Path_GetFileNameWithoutExtension_m895535029(NULL /*static, unused*/, L_20, /*hidden argument*/NULL);
		String_t* L_22 = ___filenameFormatted1;
		String_t* L_23 = Path_GetExtension_m1021339115(NULL /*static, unused*/, L_22, /*hidden argument*/NULL);
		IL2CPP_RUNTIME_CLASS_INIT(String_t_il2cpp_TypeInfo_var);
		String_t* L_24 = String_Concat_m3755062657(NULL /*static, unused*/, L_21, _stringLiteral2091341594, L_23, /*hidden argument*/NULL);
		IL2CPP_RUNTIME_CLASS_INIT(NativeGallery_t2808515514_il2cpp_TypeInfo_var);
		String_t* L_25 = NativeGallery_GetSavePath_m938747003(NULL /*static, unused*/, L_19, L_24, /*hidden argument*/NULL);
		return L_25;
	}

IL_006c:
	{
		String_t* L_26 = V_0;
		return L_26;
	}
}
// NativeGallery/Permission NativeGallery::GetMediaFromGallery(NativeGallery/MediaPickCallback,System.Boolean,System.String,System.String,System.Int32)
extern "C"  int32_t NativeGallery_GetMediaFromGallery_m2807044920 (RuntimeObject * __this /* static, unused */, MediaPickCallback_t2468098299 * ___callback0, bool ___imageMode1, String_t* ___mime2, String_t* ___title3, int32_t ___maxSize4, const RuntimeMethod* method)
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_method (NativeGallery_GetMediaFromGallery_m2807044920_MetadataUsageId);
		s_Il2CppMethodInitialized = true;
	}
	int32_t V_0 = 0;
	{
		IL2CPP_RUNTIME_CLASS_INIT(NativeGallery_t2808515514_il2cpp_TypeInfo_var);
		int32_t L_0 = NativeGallery_RequestPermission_m3085250992(NULL /*static, unused*/, /*hidden argument*/NULL);
		V_0 = L_0;
		int32_t L_1 = V_0;
		if ((!(((uint32_t)L_1) == ((uint32_t)1))))
		{
			goto IL_0048;
		}
	}
	{
		IL2CPP_RUNTIME_CLASS_INIT(NativeGallery_t2808515514_il2cpp_TypeInfo_var);
		bool L_2 = NativeGallery_IsMediaPickerBusy_m3841585438(NULL /*static, unused*/, /*hidden argument*/NULL);
		if (L_2)
		{
			goto IL_0048;
		}
	}
	{
		MediaPickCallback_t2468098299 * L_3 = ___callback0;
		NGMediaReceiveCallbackiOS_Initialize_m2371316744(NULL /*static, unused*/, L_3, /*hidden argument*/NULL);
		bool L_4 = ___imageMode1;
		if (!L_4)
		{
			goto IL_0043;
		}
	}
	{
		int32_t L_5 = ___maxSize4;
		if ((((int32_t)L_5) > ((int32_t)0)))
		{
			goto IL_0032;
		}
	}
	{
		int32_t L_6 = SystemInfo_get_maxTextureSize_m2715296278(NULL /*static, unused*/, /*hidden argument*/NULL);
		___maxSize4 = L_6;
	}

IL_0032:
	{
		IL2CPP_RUNTIME_CLASS_INIT(NativeGallery_t2808515514_il2cpp_TypeInfo_var);
		String_t* L_7 = NativeGallery_get_IOSSelectedImagePath_m2691245459(NULL /*static, unused*/, /*hidden argument*/NULL);
		int32_t L_8 = ___maxSize4;
		NativeGallery__NativeGallery_PickImage_m1523393289(NULL /*static, unused*/, L_7, L_8, /*hidden argument*/NULL);
		goto IL_0048;
	}

IL_0043:
	{
		IL2CPP_RUNTIME_CLASS_INIT(NativeGallery_t2808515514_il2cpp_TypeInfo_var);
		NativeGallery__NativeGallery_PickVideo_m2940838827(NULL /*static, unused*/, /*hidden argument*/NULL);
	}

IL_0048:
	{
		int32_t L_9 = V_0;
		return L_9;
	}
}
// NativeGallery/Permission NativeGallery::GetMultipleMediaFromGallery(NativeGallery/MediaPickMultipleCallback,System.Boolean,System.String,System.String,System.Int32)
extern "C"  int32_t NativeGallery_GetMultipleMediaFromGallery_m1977049241 (RuntimeObject * __this /* static, unused */, MediaPickMultipleCallback_t2483155519 * ___callback0, bool ___imageMode1, String_t* ___mime2, String_t* ___title3, int32_t ___maxSize4, const RuntimeMethod* method)
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_method (NativeGallery_GetMultipleMediaFromGallery_m1977049241_MetadataUsageId);
		s_Il2CppMethodInitialized = true;
	}
	int32_t V_0 = 0;
	{
		IL2CPP_RUNTIME_CLASS_INIT(NativeGallery_t2808515514_il2cpp_TypeInfo_var);
		int32_t L_0 = NativeGallery_RequestPermission_m3085250992(NULL /*static, unused*/, /*hidden argument*/NULL);
		V_0 = L_0;
		int32_t L_1 = V_0;
		if ((!(((uint32_t)L_1) == ((uint32_t)1))))
		{
			goto IL_0040;
		}
	}
	{
		IL2CPP_RUNTIME_CLASS_INIT(NativeGallery_t2808515514_il2cpp_TypeInfo_var);
		bool L_2 = NativeGallery_IsMediaPickerBusy_m3841585438(NULL /*static, unused*/, /*hidden argument*/NULL);
		if (L_2)
		{
			goto IL_0040;
		}
	}
	{
		IL2CPP_RUNTIME_CLASS_INIT(NativeGallery_t2808515514_il2cpp_TypeInfo_var);
		bool L_3 = NativeGallery_CanSelectMultipleFilesFromGallery_m1434233298(NULL /*static, unused*/, /*hidden argument*/NULL);
		if (!L_3)
		{
			goto IL_0033;
		}
	}
	{
		MediaPickMultipleCallback_t2483155519 * L_4 = ___callback0;
		if (!L_4)
		{
			goto IL_002e;
		}
	}
	{
		MediaPickMultipleCallback_t2483155519 * L_5 = ___callback0;
		NullCheck(L_5);
		MediaPickMultipleCallback_Invoke_m898928969(L_5, (StringU5BU5D_t1281789340*)(StringU5BU5D_t1281789340*)NULL, /*hidden argument*/NULL);
	}

IL_002e:
	{
		goto IL_0040;
	}

IL_0033:
	{
		MediaPickMultipleCallback_t2483155519 * L_6 = ___callback0;
		if (!L_6)
		{
			goto IL_0040;
		}
	}
	{
		MediaPickMultipleCallback_t2483155519 * L_7 = ___callback0;
		NullCheck(L_7);
		MediaPickMultipleCallback_Invoke_m898928969(L_7, (StringU5BU5D_t1281789340*)(StringU5BU5D_t1281789340*)NULL, /*hidden argument*/NULL);
	}

IL_0040:
	{
		int32_t L_8 = V_0;
		return L_8;
	}
}
// UnityEngine.Texture2D NativeGallery::LoadImageAtPath(System.String,System.Int32,System.Boolean,System.Boolean,System.Boolean)
extern "C"  Texture2D_t3840446185 * NativeGallery_LoadImageAtPath_m3208821149 (RuntimeObject * __this /* static, unused */, String_t* ___imagePath0, int32_t ___maxSize1, bool ___markTextureNonReadable2, bool ___generateMipmaps3, bool ___linearColorSpace4, const RuntimeMethod* method)
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_method (NativeGallery_LoadImageAtPath_m3208821149_MetadataUsageId);
		s_Il2CppMethodInitialized = true;
	}
	String_t* V_0 = NULL;
	String_t* V_1 = NULL;
	int32_t V_2 = 0;
	Texture2D_t3840446185 * V_3 = NULL;
	Texture2D_t3840446185 * V_4 = NULL;
	Exception_t * V_5 = NULL;
	Exception_t * __last_unhandled_exception = 0;
	NO_UNUSED_WARNING (__last_unhandled_exception);
	Exception_t * __exception_local = 0;
	NO_UNUSED_WARNING (__exception_local);
	int32_t __leave_target = 0;
	NO_UNUSED_WARNING (__leave_target);
	int32_t G_B10_0 = 0;
	{
		String_t* L_0 = ___imagePath0;
		IL2CPP_RUNTIME_CLASS_INIT(String_t_il2cpp_TypeInfo_var);
		bool L_1 = String_IsNullOrEmpty_m2969720369(NULL /*static, unused*/, L_0, /*hidden argument*/NULL);
		if (!L_1)
		{
			goto IL_0016;
		}
	}
	{
		ArgumentException_t132251570 * L_2 = (ArgumentException_t132251570 *)il2cpp_codegen_object_new(ArgumentException_t132251570_il2cpp_TypeInfo_var);
		ArgumentException__ctor_m1312628991(L_2, _stringLiteral1045150428, /*hidden argument*/NULL);
		IL2CPP_RAISE_MANAGED_EXCEPTION(L_2, NULL, NativeGallery_LoadImageAtPath_m3208821149_RuntimeMethod_var);
	}

IL_0016:
	{
		String_t* L_3 = ___imagePath0;
		bool L_4 = File_Exists_m3943585060(NULL /*static, unused*/, L_3, /*hidden argument*/NULL);
		if (L_4)
		{
			goto IL_0032;
		}
	}
	{
		String_t* L_5 = ___imagePath0;
		IL2CPP_RUNTIME_CLASS_INIT(String_t_il2cpp_TypeInfo_var);
		String_t* L_6 = String_Concat_m3937257545(NULL /*static, unused*/, _stringLiteral1685319404, L_5, /*hidden argument*/NULL);
		FileNotFoundException_t225391025 * L_7 = (FileNotFoundException_t225391025 *)il2cpp_codegen_object_new(FileNotFoundException_t225391025_il2cpp_TypeInfo_var);
		FileNotFoundException__ctor_m3252664930(L_7, L_6, /*hidden argument*/NULL);
		IL2CPP_RAISE_MANAGED_EXCEPTION(L_7, NULL, NativeGallery_LoadImageAtPath_m3208821149_RuntimeMethod_var);
	}

IL_0032:
	{
		int32_t L_8 = ___maxSize1;
		if ((((int32_t)L_8) > ((int32_t)0)))
		{
			goto IL_0040;
		}
	}
	{
		int32_t L_9 = SystemInfo_get_maxTextureSize_m2715296278(NULL /*static, unused*/, /*hidden argument*/NULL);
		___maxSize1 = L_9;
	}

IL_0040:
	{
		String_t* L_10 = ___imagePath0;
		IL2CPP_RUNTIME_CLASS_INIT(NativeGallery_t2808515514_il2cpp_TypeInfo_var);
		String_t* L_11 = NativeGallery_get_TemporaryImagePath_m1358311393(NULL /*static, unused*/, /*hidden argument*/NULL);
		int32_t L_12 = ___maxSize1;
		String_t* L_13 = NativeGallery__NativeGallery_LoadImageAtPath_m570075515(NULL /*static, unused*/, L_10, L_11, L_12, /*hidden argument*/NULL);
		V_0 = L_13;
		String_t* L_14 = ___imagePath0;
		IL2CPP_RUNTIME_CLASS_INIT(Path_t1605229823_il2cpp_TypeInfo_var);
		String_t* L_15 = Path_GetExtension_m1021339115(NULL /*static, unused*/, L_14, /*hidden argument*/NULL);
		NullCheck(L_15);
		String_t* L_16 = String_ToLowerInvariant_m110751226(L_15, /*hidden argument*/NULL);
		V_1 = L_16;
		String_t* L_17 = V_1;
		IL2CPP_RUNTIME_CLASS_INIT(String_t_il2cpp_TypeInfo_var);
		bool L_18 = String_op_Equality_m920492651(NULL /*static, unused*/, L_17, _stringLiteral2860068956, /*hidden argument*/NULL);
		if (L_18)
		{
			goto IL_0079;
		}
	}
	{
		String_t* L_19 = V_1;
		IL2CPP_RUNTIME_CLASS_INIT(String_t_il2cpp_TypeInfo_var);
		bool L_20 = String_op_Equality_m920492651(NULL /*static, unused*/, L_19, _stringLiteral2063196619, /*hidden argument*/NULL);
		if (!L_20)
		{
			goto IL_007f;
		}
	}

IL_0079:
	{
		G_B10_0 = 3;
		goto IL_0080;
	}

IL_007f:
	{
		G_B10_0 = 4;
	}

IL_0080:
	{
		V_2 = G_B10_0;
		int32_t L_21 = V_2;
		bool L_22 = ___generateMipmaps3;
		bool L_23 = ___linearColorSpace4;
		Texture2D_t3840446185 * L_24 = (Texture2D_t3840446185 *)il2cpp_codegen_object_new(Texture2D_t3840446185_il2cpp_TypeInfo_var);
		Texture2D__ctor_m1269666504(L_24, 2, 2, L_21, L_22, L_23, /*hidden argument*/NULL);
		V_3 = L_24;
	}

IL_008d:
	try
	{ // begin try (depth: 1)
		try
		{ // begin try (depth: 2)
			{
				Texture2D_t3840446185 * L_25 = V_3;
				String_t* L_26 = V_0;
				ByteU5BU5D_t4116647657* L_27 = File_ReadAllBytes_m1435775076(NULL /*static, unused*/, L_26, /*hidden argument*/NULL);
				bool L_28 = ___markTextureNonReadable2;
				bool L_29 = ImageConversion_LoadImage_m601733642(NULL /*static, unused*/, L_25, L_27, L_28, /*hidden argument*/NULL);
				if (L_29)
				{
					goto IL_00ad;
				}
			}

IL_009f:
			{
				Texture2D_t3840446185 * L_30 = V_3;
				IL2CPP_RUNTIME_CLASS_INIT(Object_t631007953_il2cpp_TypeInfo_var);
				Object_DestroyImmediate_m3193525861(NULL /*static, unused*/, L_30, /*hidden argument*/NULL);
				V_4 = (Texture2D_t3840446185 *)NULL;
				IL2CPP_LEAVE(0xE9, FINALLY_00c9);
			}

IL_00ad:
			{
				IL2CPP_LEAVE(0xE7, FINALLY_00c9);
			}
		} // end try (depth: 2)
		catch(Il2CppExceptionWrapper& e)
		{
			__exception_local = (Exception_t *)e.ex;
			if(il2cpp_codegen_class_is_assignable_from (Exception_t_il2cpp_TypeInfo_var, il2cpp_codegen_object_class(e.ex)))
				goto CATCH_00b2;
			throw e;
		}

CATCH_00b2:
		{ // begin catch(System.Exception)
			V_5 = ((Exception_t *)__exception_local);
			Exception_t * L_31 = V_5;
			IL2CPP_RUNTIME_CLASS_INIT(Debug_t3317548046_il2cpp_TypeInfo_var);
			Debug_LogException_m2207318968(NULL /*static, unused*/, L_31, /*hidden argument*/NULL);
			Texture2D_t3840446185 * L_32 = V_3;
			IL2CPP_RUNTIME_CLASS_INIT(Object_t631007953_il2cpp_TypeInfo_var);
			Object_DestroyImmediate_m3193525861(NULL /*static, unused*/, L_32, /*hidden argument*/NULL);
			V_4 = (Texture2D_t3840446185 *)NULL;
			IL2CPP_LEAVE(0xE9, FINALLY_00c9);
		} // end catch (depth: 2)
	} // end try (depth: 1)
	catch(Il2CppExceptionWrapper& e)
	{
		__last_unhandled_exception = (Exception_t *)e.ex;
		goto FINALLY_00c9;
	}

FINALLY_00c9:
	{ // begin finally (depth: 1)
		{
			String_t* L_33 = V_0;
			String_t* L_34 = ___imagePath0;
			IL2CPP_RUNTIME_CLASS_INIT(String_t_il2cpp_TypeInfo_var);
			bool L_35 = String_op_Inequality_m215368492(NULL /*static, unused*/, L_33, L_34, /*hidden argument*/NULL);
			if (!L_35)
			{
				goto IL_00e6;
			}
		}

IL_00d5:
		try
		{ // begin try (depth: 2)
			String_t* L_36 = V_0;
			File_Delete_m321251800(NULL /*static, unused*/, L_36, /*hidden argument*/NULL);
			goto IL_00e6;
		} // end try (depth: 2)
		catch(Il2CppExceptionWrapper& e)
		{
			__exception_local = (Exception_t *)e.ex;
			if(il2cpp_codegen_class_is_assignable_from (RuntimeObject_il2cpp_TypeInfo_var, il2cpp_codegen_object_class(e.ex)))
				goto CATCH_00e0;
			throw e;
		}

CATCH_00e0:
		{ // begin catch(System.Object)
			goto IL_00e6;
		} // end catch (depth: 2)

IL_00e6:
		{
			IL2CPP_END_FINALLY(201)
		}
	} // end finally (depth: 1)
	IL2CPP_CLEANUP(201)
	{
		IL2CPP_JUMP_TBL(0xE9, IL_00e9)
		IL2CPP_JUMP_TBL(0xE7, IL_00e7)
		IL2CPP_RETHROW_IF_UNHANDLED(Exception_t *)
	}

IL_00e7:
	{
		Texture2D_t3840446185 * L_37 = V_3;
		return L_37;
	}

IL_00e9:
	{
		Texture2D_t3840446185 * L_38 = V_4;
		return L_38;
	}
}
// NativeGallery/ImageProperties NativeGallery::GetImageProperties(System.String)
extern "C"  ImageProperties_t914339828  NativeGallery_GetImageProperties_m3966117691 (RuntimeObject * __this /* static, unused */, String_t* ___imagePath0, const RuntimeMethod* method)
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_method (NativeGallery_GetImageProperties_m3966117691_MetadataUsageId);
		s_Il2CppMethodInitialized = true;
	}
	String_t* V_0 = NULL;
	int32_t V_1 = 0;
	int32_t V_2 = 0;
	String_t* V_3 = NULL;
	int32_t V_4 = 0;
	StringU5BU5D_t1281789340* V_5 = NULL;
	String_t* V_6 = NULL;
	int32_t V_7 = 0;
	{
		String_t* L_0 = ___imagePath0;
		bool L_1 = File_Exists_m3943585060(NULL /*static, unused*/, L_0, /*hidden argument*/NULL);
		if (L_1)
		{
			goto IL_001c;
		}
	}
	{
		String_t* L_2 = ___imagePath0;
		IL2CPP_RUNTIME_CLASS_INIT(String_t_il2cpp_TypeInfo_var);
		String_t* L_3 = String_Concat_m3937257545(NULL /*static, unused*/, _stringLiteral1685319404, L_2, /*hidden argument*/NULL);
		FileNotFoundException_t225391025 * L_4 = (FileNotFoundException_t225391025 *)il2cpp_codegen_object_new(FileNotFoundException_t225391025_il2cpp_TypeInfo_var);
		FileNotFoundException__ctor_m3252664930(L_4, L_3, /*hidden argument*/NULL);
		IL2CPP_RAISE_MANAGED_EXCEPTION(L_4, NULL, NativeGallery_GetImageProperties_m3966117691_RuntimeMethod_var);
	}

IL_001c:
	{
		String_t* L_5 = ___imagePath0;
		IL2CPP_RUNTIME_CLASS_INIT(NativeGallery_t2808515514_il2cpp_TypeInfo_var);
		String_t* L_6 = NativeGallery__NativeGallery_GetImageProperties_m210662476(NULL /*static, unused*/, L_5, /*hidden argument*/NULL);
		V_0 = L_6;
		V_1 = 0;
		V_2 = 0;
		V_3 = (String_t*)NULL;
		V_4 = (-1);
		String_t* L_7 = V_0;
		IL2CPP_RUNTIME_CLASS_INIT(String_t_il2cpp_TypeInfo_var);
		bool L_8 = String_IsNullOrEmpty_m2969720369(NULL /*static, unused*/, L_7, /*hidden argument*/NULL);
		if (L_8)
		{
			goto IL_0152;
		}
	}
	{
		String_t* L_9 = V_0;
		CharU5BU5D_t3528271667* L_10 = ((CharU5BU5D_t3528271667*)SZArrayNew(CharU5BU5D_t3528271667_il2cpp_TypeInfo_var, (uint32_t)1));
		NullCheck(L_10);
		(L_10)->SetAt(static_cast<il2cpp_array_size_t>(0), (Il2CppChar)((int32_t)62));
		NullCheck(L_9);
		StringU5BU5D_t1281789340* L_11 = String_Split_m3646115398(L_9, L_10, /*hidden argument*/NULL);
		V_5 = L_11;
		StringU5BU5D_t1281789340* L_12 = V_5;
		if (!L_12)
		{
			goto IL_0152;
		}
	}
	{
		StringU5BU5D_t1281789340* L_13 = V_5;
		NullCheck(L_13);
		if ((((int32_t)(((int32_t)((int32_t)(((RuntimeArray *)L_13)->max_length))))) < ((int32_t)4)))
		{
			goto IL_0152;
		}
	}
	{
		StringU5BU5D_t1281789340* L_14 = V_5;
		NullCheck(L_14);
		int32_t L_15 = 0;
		String_t* L_16 = (L_14)->GetAt(static_cast<il2cpp_array_size_t>(L_15));
		NullCheck(L_16);
		String_t* L_17 = String_Trim_m923598732(L_16, /*hidden argument*/NULL);
		bool L_18 = Int32_TryParse_m2404707562(NULL /*static, unused*/, L_17, (int32_t*)(&V_1), /*hidden argument*/NULL);
		if (L_18)
		{
			goto IL_0072;
		}
	}
	{
		V_1 = 0;
	}

IL_0072:
	{
		StringU5BU5D_t1281789340* L_19 = V_5;
		NullCheck(L_19);
		int32_t L_20 = 1;
		String_t* L_21 = (L_19)->GetAt(static_cast<il2cpp_array_size_t>(L_20));
		NullCheck(L_21);
		String_t* L_22 = String_Trim_m923598732(L_21, /*hidden argument*/NULL);
		bool L_23 = Int32_TryParse_m2404707562(NULL /*static, unused*/, L_22, (int32_t*)(&V_2), /*hidden argument*/NULL);
		if (L_23)
		{
			goto IL_0089;
		}
	}
	{
		V_2 = 0;
	}

IL_0089:
	{
		StringU5BU5D_t1281789340* L_24 = V_5;
		NullCheck(L_24);
		int32_t L_25 = 2;
		String_t* L_26 = (L_24)->GetAt(static_cast<il2cpp_array_size_t>(L_25));
		NullCheck(L_26);
		String_t* L_27 = String_Trim_m923598732(L_26, /*hidden argument*/NULL);
		V_3 = L_27;
		String_t* L_28 = V_3;
		NullCheck(L_28);
		int32_t L_29 = String_get_Length_m3847582255(L_28, /*hidden argument*/NULL);
		if (L_29)
		{
			goto IL_012e;
		}
	}
	{
		String_t* L_30 = ___imagePath0;
		IL2CPP_RUNTIME_CLASS_INIT(Path_t1605229823_il2cpp_TypeInfo_var);
		String_t* L_31 = Path_GetExtension_m1021339115(NULL /*static, unused*/, L_30, /*hidden argument*/NULL);
		NullCheck(L_31);
		String_t* L_32 = String_ToLowerInvariant_m110751226(L_31, /*hidden argument*/NULL);
		V_6 = L_32;
		String_t* L_33 = V_6;
		IL2CPP_RUNTIME_CLASS_INIT(String_t_il2cpp_TypeInfo_var);
		bool L_34 = String_op_Equality_m920492651(NULL /*static, unused*/, L_33, _stringLiteral2410385622, /*hidden argument*/NULL);
		if (!L_34)
		{
			goto IL_00c7;
		}
	}
	{
		V_3 = _stringLiteral2045074213;
		goto IL_012e;
	}

IL_00c7:
	{
		String_t* L_35 = V_6;
		IL2CPP_RUNTIME_CLASS_INIT(String_t_il2cpp_TypeInfo_var);
		bool L_36 = String_op_Equality_m920492651(NULL /*static, unused*/, L_35, _stringLiteral2860068956, /*hidden argument*/NULL);
		if (L_36)
		{
			goto IL_00e9;
		}
	}
	{
		String_t* L_37 = V_6;
		IL2CPP_RUNTIME_CLASS_INIT(String_t_il2cpp_TypeInfo_var);
		bool L_38 = String_op_Equality_m920492651(NULL /*static, unused*/, L_37, _stringLiteral2063196619, /*hidden argument*/NULL);
		if (!L_38)
		{
			goto IL_00f4;
		}
	}

IL_00e9:
	{
		V_3 = _stringLiteral1377815833;
		goto IL_012e;
	}

IL_00f4:
	{
		String_t* L_39 = V_6;
		IL2CPP_RUNTIME_CLASS_INIT(String_t_il2cpp_TypeInfo_var);
		bool L_40 = String_op_Equality_m920492651(NULL /*static, unused*/, L_39, _stringLiteral3988015567, /*hidden argument*/NULL);
		if (!L_40)
		{
			goto IL_0110;
		}
	}
	{
		V_3 = _stringLiteral2869855759;
		goto IL_012e;
	}

IL_0110:
	{
		String_t* L_41 = V_6;
		IL2CPP_RUNTIME_CLASS_INIT(String_t_il2cpp_TypeInfo_var);
		bool L_42 = String_op_Equality_m920492651(NULL /*static, unused*/, L_41, _stringLiteral1929714747, /*hidden argument*/NULL);
		if (!L_42)
		{
			goto IL_012c;
		}
	}
	{
		V_3 = _stringLiteral2508466260;
		goto IL_012e;
	}

IL_012c:
	{
		V_3 = (String_t*)NULL;
	}

IL_012e:
	{
		StringU5BU5D_t1281789340* L_43 = V_5;
		NullCheck(L_43);
		int32_t L_44 = 3;
		String_t* L_45 = (L_43)->GetAt(static_cast<il2cpp_array_size_t>(L_44));
		NullCheck(L_45);
		String_t* L_46 = String_Trim_m923598732(L_45, /*hidden argument*/NULL);
		bool L_47 = Int32_TryParse_m2404707562(NULL /*static, unused*/, L_46, (int32_t*)(&V_7), /*hidden argument*/NULL);
		if (!L_47)
		{
			goto IL_0147;
		}
	}
	{
		int32_t L_48 = V_7;
		V_4 = L_48;
	}

IL_0147:
	{
		int32_t L_49 = V_4;
		if ((!(((uint32_t)L_49) == ((uint32_t)(-1)))))
		{
			goto IL_0152;
		}
	}
	{
		V_4 = 0;
	}

IL_0152:
	{
		int32_t L_50 = V_1;
		int32_t L_51 = V_2;
		String_t* L_52 = V_3;
		int32_t L_53 = V_4;
		ImageProperties_t914339828  L_54;
		memset(&L_54, 0, sizeof(L_54));
		ImageProperties__ctor_m3374032026((&L_54), L_50, L_51, L_52, L_53, /*hidden argument*/NULL);
		return L_54;
	}
}
// System.Void NativeGallery::.cctor()
extern "C"  void NativeGallery__cctor_m693180091 (RuntimeObject * __this /* static, unused */, const RuntimeMethod* method)
{
	{
		return;
	}
}
#ifdef __clang__
#pragma clang diagnostic pop
#endif
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif
#ifdef __clang__
#pragma clang diagnostic pop
#endif
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif
// Conversion methods for marshalling of: NativeGallery/ImageProperties
extern "C" void ImageProperties_t914339828_marshal_pinvoke(const ImageProperties_t914339828& unmarshaled, ImageProperties_t914339828_marshaled_pinvoke& marshaled)
{
	marshaled.___width_0 = unmarshaled.get_width_0();
	marshaled.___height_1 = unmarshaled.get_height_1();
	marshaled.___mimeType_2 = il2cpp_codegen_marshal_string(unmarshaled.get_mimeType_2());
	marshaled.___orientation_3 = unmarshaled.get_orientation_3();
}
extern "C" void ImageProperties_t914339828_marshal_pinvoke_back(const ImageProperties_t914339828_marshaled_pinvoke& marshaled, ImageProperties_t914339828& unmarshaled)
{
	int32_t unmarshaled_width_temp_0 = 0;
	unmarshaled_width_temp_0 = marshaled.___width_0;
	unmarshaled.set_width_0(unmarshaled_width_temp_0);
	int32_t unmarshaled_height_temp_1 = 0;
	unmarshaled_height_temp_1 = marshaled.___height_1;
	unmarshaled.set_height_1(unmarshaled_height_temp_1);
	unmarshaled.set_mimeType_2(il2cpp_codegen_marshal_string_result(marshaled.___mimeType_2));
	int32_t unmarshaled_orientation_temp_3 = 0;
	unmarshaled_orientation_temp_3 = marshaled.___orientation_3;
	unmarshaled.set_orientation_3(unmarshaled_orientation_temp_3);
}
// Conversion method for clean up from marshalling of: NativeGallery/ImageProperties
extern "C" void ImageProperties_t914339828_marshal_pinvoke_cleanup(ImageProperties_t914339828_marshaled_pinvoke& marshaled)
{
	il2cpp_codegen_marshal_free(marshaled.___mimeType_2);
	marshaled.___mimeType_2 = NULL;
}
// Conversion methods for marshalling of: NativeGallery/ImageProperties
extern "C" void ImageProperties_t914339828_marshal_com(const ImageProperties_t914339828& unmarshaled, ImageProperties_t914339828_marshaled_com& marshaled)
{
	marshaled.___width_0 = unmarshaled.get_width_0();
	marshaled.___height_1 = unmarshaled.get_height_1();
	marshaled.___mimeType_2 = il2cpp_codegen_marshal_bstring(unmarshaled.get_mimeType_2());
	marshaled.___orientation_3 = unmarshaled.get_orientation_3();
}
extern "C" void ImageProperties_t914339828_marshal_com_back(const ImageProperties_t914339828_marshaled_com& marshaled, ImageProperties_t914339828& unmarshaled)
{
	int32_t unmarshaled_width_temp_0 = 0;
	unmarshaled_width_temp_0 = marshaled.___width_0;
	unmarshaled.set_width_0(unmarshaled_width_temp_0);
	int32_t unmarshaled_height_temp_1 = 0;
	unmarshaled_height_temp_1 = marshaled.___height_1;
	unmarshaled.set_height_1(unmarshaled_height_temp_1);
	unmarshaled.set_mimeType_2(il2cpp_codegen_marshal_bstring_result(marshaled.___mimeType_2));
	int32_t unmarshaled_orientation_temp_3 = 0;
	unmarshaled_orientation_temp_3 = marshaled.___orientation_3;
	unmarshaled.set_orientation_3(unmarshaled_orientation_temp_3);
}
// Conversion method for clean up from marshalling of: NativeGallery/ImageProperties
extern "C" void ImageProperties_t914339828_marshal_com_cleanup(ImageProperties_t914339828_marshaled_com& marshaled)
{
	il2cpp_codegen_marshal_free_bstring(marshaled.___mimeType_2);
	marshaled.___mimeType_2 = NULL;
}
// System.Void NativeGallery/ImageProperties::.ctor(System.Int32,System.Int32,System.String,NativeGallery/ImageOrientation)
extern "C"  void ImageProperties__ctor_m3374032026 (ImageProperties_t914339828 * __this, int32_t ___width0, int32_t ___height1, String_t* ___mimeType2, int32_t ___orientation3, const RuntimeMethod* method)
{
	{
		int32_t L_0 = ___width0;
		__this->set_width_0(L_0);
		int32_t L_1 = ___height1;
		__this->set_height_1(L_1);
		String_t* L_2 = ___mimeType2;
		__this->set_mimeType_2(L_2);
		int32_t L_3 = ___orientation3;
		__this->set_orientation_3(L_3);
		return;
	}
}
extern "C"  void ImageProperties__ctor_m3374032026_AdjustorThunk (RuntimeObject * __this, int32_t ___width0, int32_t ___height1, String_t* ___mimeType2, int32_t ___orientation3, const RuntimeMethod* method)
{
	ImageProperties_t914339828 * _thisAdjusted = reinterpret_cast<ImageProperties_t914339828 *>(__this + 1);
	ImageProperties__ctor_m3374032026(_thisAdjusted, ___width0, ___height1, ___mimeType2, ___orientation3, method);
}
#ifdef __clang__
#pragma clang diagnostic pop
#endif
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif
extern "C"  void DelegatePInvokeWrapper_MediaPickCallback_t2468098299 (MediaPickCallback_t2468098299 * __this, String_t* ___path0, const RuntimeMethod* method)
{
	typedef void (STDCALL *PInvokeFunc)(char*);
	PInvokeFunc il2cppPInvokeFunc = reinterpret_cast<PInvokeFunc>(il2cpp_codegen_get_method_pointer(((RuntimeDelegate*)__this)->method));

	// Marshaling of parameter '___path0' to native representation
	char* ____path0_marshaled = NULL;
	____path0_marshaled = il2cpp_codegen_marshal_string(___path0);

	// Native function invocation
	il2cppPInvokeFunc(____path0_marshaled);

	// Marshaling cleanup of parameter '___path0' native representation
	il2cpp_codegen_marshal_free(____path0_marshaled);
	____path0_marshaled = NULL;

}
// System.Void NativeGallery/MediaPickCallback::.ctor(System.Object,System.IntPtr)
extern "C"  void MediaPickCallback__ctor_m2823130793 (MediaPickCallback_t2468098299 * __this, RuntimeObject * ___object0, intptr_t ___method1, const RuntimeMethod* method)
{
	__this->set_method_ptr_0(il2cpp_codegen_get_method_pointer((RuntimeMethod*)___method1));
	__this->set_method_3(___method1);
	__this->set_m_target_2(___object0);
}
// System.Void NativeGallery/MediaPickCallback::Invoke(System.String)
extern "C"  void MediaPickCallback_Invoke_m771420990 (MediaPickCallback_t2468098299 * __this, String_t* ___path0, const RuntimeMethod* method)
{
	if(__this->get_prev_9() != NULL)
	{
		MediaPickCallback_Invoke_m771420990((MediaPickCallback_t2468098299 *)__this->get_prev_9(), ___path0, method);
	}
	Il2CppMethodPointer targetMethodPointer = __this->get_method_ptr_0();
	RuntimeMethod* targetMethod = (RuntimeMethod*)(__this->get_method_3());
	RuntimeObject* targetThis = __this->get_m_target_2();
	il2cpp_codegen_raise_execution_engine_exception_if_method_is_not_found(targetMethod);
	bool ___methodIsStatic = MethodIsStatic(targetMethod);
	if (___methodIsStatic)
	{
		if (il2cpp_codegen_method_parameter_count(targetMethod) == 1)
		{
			// open
			{
				typedef void (*FunctionPointerType) (RuntimeObject *, String_t*, const RuntimeMethod*);
				((FunctionPointerType)targetMethodPointer)(NULL, ___path0, targetMethod);
			}
		}
		else
		{
			// closed
			{
				typedef void (*FunctionPointerType) (RuntimeObject *, void*, String_t*, const RuntimeMethod*);
				((FunctionPointerType)targetMethodPointer)(NULL, targetThis, ___path0, targetMethod);
			}
		}
	}
	else
	{
		if (il2cpp_codegen_method_parameter_count(targetMethod) == 1)
		{
			// closed
			if (il2cpp_codegen_method_is_virtual(targetMethod) && !il2cpp_codegen_object_is_of_sealed_type(targetThis) && il2cpp_codegen_delegate_has_invoker((Il2CppDelegate*)__this))
			{
				if (il2cpp_codegen_method_is_generic_instance(targetMethod))
				{
					if (il2cpp_codegen_method_is_interface_method(targetMethod))
						GenericInterfaceActionInvoker1< String_t* >::Invoke(targetMethod, targetThis, ___path0);
					else
						GenericVirtActionInvoker1< String_t* >::Invoke(targetMethod, targetThis, ___path0);
				}
				else
				{
					if (il2cpp_codegen_method_is_interface_method(targetMethod))
						InterfaceActionInvoker1< String_t* >::Invoke(il2cpp_codegen_method_get_slot(targetMethod), il2cpp_codegen_method_get_declaring_type(targetMethod), targetThis, ___path0);
					else
						VirtActionInvoker1< String_t* >::Invoke(il2cpp_codegen_method_get_slot(targetMethod), targetThis, ___path0);
				}
			}
			else
			{
				typedef void (*FunctionPointerType) (void*, String_t*, const RuntimeMethod*);
				((FunctionPointerType)targetMethodPointer)(targetThis, ___path0, targetMethod);
			}
		}
		else
		{
			// open
			if (il2cpp_codegen_method_is_virtual(targetMethod) && !il2cpp_codegen_object_is_of_sealed_type(targetThis) && il2cpp_codegen_delegate_has_invoker((Il2CppDelegate*)__this))
			{
				if (il2cpp_codegen_method_is_generic_instance(targetMethod))
				{
					if (il2cpp_codegen_method_is_interface_method(targetMethod))
						GenericInterfaceActionInvoker0::Invoke(targetMethod, ___path0);
					else
						GenericVirtActionInvoker0::Invoke(targetMethod, ___path0);
				}
				else
				{
					if (il2cpp_codegen_method_is_interface_method(targetMethod))
						InterfaceActionInvoker0::Invoke(il2cpp_codegen_method_get_slot(targetMethod), il2cpp_codegen_method_get_declaring_type(targetMethod), ___path0);
					else
						VirtActionInvoker0::Invoke(il2cpp_codegen_method_get_slot(targetMethod), ___path0);
				}
			}
			else
			{
				typedef void (*FunctionPointerType) (String_t*, const RuntimeMethod*);
				((FunctionPointerType)targetMethodPointer)(___path0, targetMethod);
			}
		}
	}
}
// System.IAsyncResult NativeGallery/MediaPickCallback::BeginInvoke(System.String,System.AsyncCallback,System.Object)
extern "C"  RuntimeObject* MediaPickCallback_BeginInvoke_m331196563 (MediaPickCallback_t2468098299 * __this, String_t* ___path0, AsyncCallback_t3962456242 * ___callback1, RuntimeObject * ___object2, const RuntimeMethod* method)
{
	void *__d_args[2] = {0};
	__d_args[0] = ___path0;
	return (RuntimeObject*)il2cpp_codegen_delegate_begin_invoke((RuntimeDelegate*)__this, __d_args, (RuntimeDelegate*)___callback1, (RuntimeObject*)___object2);
}
// System.Void NativeGallery/MediaPickCallback::EndInvoke(System.IAsyncResult)
extern "C"  void MediaPickCallback_EndInvoke_m736713469 (MediaPickCallback_t2468098299 * __this, RuntimeObject* ___result0, const RuntimeMethod* method)
{
	il2cpp_codegen_delegate_end_invoke((Il2CppAsyncResult*) ___result0, 0);
}
#ifdef __clang__
#pragma clang diagnostic pop
#endif
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif
extern "C"  void DelegatePInvokeWrapper_MediaPickMultipleCallback_t2483155519 (MediaPickMultipleCallback_t2483155519 * __this, StringU5BU5D_t1281789340* ___paths0, const RuntimeMethod* method)
{
	typedef void (STDCALL *PInvokeFunc)(char**);
	PInvokeFunc il2cppPInvokeFunc = reinterpret_cast<PInvokeFunc>(il2cpp_codegen_get_method_pointer(((RuntimeDelegate*)__this)->method));

	// Marshaling of parameter '___paths0' to native representation
	char** ____paths0_marshaled = NULL;
	if (___paths0 != NULL)
	{
		il2cpp_array_size_t ____paths0_Length = (___paths0)->max_length;
		____paths0_marshaled = il2cpp_codegen_marshal_allocate_array<char*>(____paths0_Length + 1);
		(____paths0_marshaled)[____paths0_Length] = NULL;
		for (int32_t i = 0; i < ARRAY_LENGTH_AS_INT32(____paths0_Length); i++)
		{
			(____paths0_marshaled)[i] = il2cpp_codegen_marshal_string((___paths0)->GetAtUnchecked(static_cast<il2cpp_array_size_t>(i)));
		}
	}
	else
	{
		____paths0_marshaled = NULL;
	}

	// Native function invocation
	il2cppPInvokeFunc(____paths0_marshaled);

	// Marshaling cleanup of parameter '___paths0' native representation
	if (____paths0_marshaled != NULL)
	{
		const il2cpp_array_size_t ____paths0_marshaled_CleanupLoopCount = (___paths0 != NULL) ? (___paths0)->max_length : 0;
		for (int32_t i = 0; i < ARRAY_LENGTH_AS_INT32(____paths0_marshaled_CleanupLoopCount); i++)
		{
			il2cpp_codegen_marshal_free((____paths0_marshaled)[i]);
			(____paths0_marshaled)[i] = NULL;
		}
		il2cpp_codegen_marshal_free(____paths0_marshaled);
		____paths0_marshaled = NULL;
	}

}
// System.Void NativeGallery/MediaPickMultipleCallback::.ctor(System.Object,System.IntPtr)
extern "C"  void MediaPickMultipleCallback__ctor_m1645103251 (MediaPickMultipleCallback_t2483155519 * __this, RuntimeObject * ___object0, intptr_t ___method1, const RuntimeMethod* method)
{
	__this->set_method_ptr_0(il2cpp_codegen_get_method_pointer((RuntimeMethod*)___method1));
	__this->set_method_3(___method1);
	__this->set_m_target_2(___object0);
}
// System.Void NativeGallery/MediaPickMultipleCallback::Invoke(System.String[])
extern "C"  void MediaPickMultipleCallback_Invoke_m898928969 (MediaPickMultipleCallback_t2483155519 * __this, StringU5BU5D_t1281789340* ___paths0, const RuntimeMethod* method)
{
	if(__this->get_prev_9() != NULL)
	{
		MediaPickMultipleCallback_Invoke_m898928969((MediaPickMultipleCallback_t2483155519 *)__this->get_prev_9(), ___paths0, method);
	}
	Il2CppMethodPointer targetMethodPointer = __this->get_method_ptr_0();
	RuntimeMethod* targetMethod = (RuntimeMethod*)(__this->get_method_3());
	RuntimeObject* targetThis = __this->get_m_target_2();
	il2cpp_codegen_raise_execution_engine_exception_if_method_is_not_found(targetMethod);
	bool ___methodIsStatic = MethodIsStatic(targetMethod);
	if (___methodIsStatic)
	{
		if (il2cpp_codegen_method_parameter_count(targetMethod) == 1)
		{
			// open
			{
				typedef void (*FunctionPointerType) (RuntimeObject *, StringU5BU5D_t1281789340*, const RuntimeMethod*);
				((FunctionPointerType)targetMethodPointer)(NULL, ___paths0, targetMethod);
			}
		}
		else
		{
			// closed
			{
				typedef void (*FunctionPointerType) (RuntimeObject *, void*, StringU5BU5D_t1281789340*, const RuntimeMethod*);
				((FunctionPointerType)targetMethodPointer)(NULL, targetThis, ___paths0, targetMethod);
			}
		}
	}
	else
	{
		if (il2cpp_codegen_method_parameter_count(targetMethod) == 1)
		{
			// closed
			if (il2cpp_codegen_method_is_virtual(targetMethod) && !il2cpp_codegen_object_is_of_sealed_type(targetThis) && il2cpp_codegen_delegate_has_invoker((Il2CppDelegate*)__this))
			{
				if (il2cpp_codegen_method_is_generic_instance(targetMethod))
				{
					if (il2cpp_codegen_method_is_interface_method(targetMethod))
						GenericInterfaceActionInvoker1< StringU5BU5D_t1281789340* >::Invoke(targetMethod, targetThis, ___paths0);
					else
						GenericVirtActionInvoker1< StringU5BU5D_t1281789340* >::Invoke(targetMethod, targetThis, ___paths0);
				}
				else
				{
					if (il2cpp_codegen_method_is_interface_method(targetMethod))
						InterfaceActionInvoker1< StringU5BU5D_t1281789340* >::Invoke(il2cpp_codegen_method_get_slot(targetMethod), il2cpp_codegen_method_get_declaring_type(targetMethod), targetThis, ___paths0);
					else
						VirtActionInvoker1< StringU5BU5D_t1281789340* >::Invoke(il2cpp_codegen_method_get_slot(targetMethod), targetThis, ___paths0);
				}
			}
			else
			{
				typedef void (*FunctionPointerType) (void*, StringU5BU5D_t1281789340*, const RuntimeMethod*);
				((FunctionPointerType)targetMethodPointer)(targetThis, ___paths0, targetMethod);
			}
		}
		else
		{
			// open
			if (il2cpp_codegen_method_is_virtual(targetMethod) && !il2cpp_codegen_object_is_of_sealed_type(targetThis) && il2cpp_codegen_delegate_has_invoker((Il2CppDelegate*)__this))
			{
				if (il2cpp_codegen_method_is_generic_instance(targetMethod))
				{
					if (il2cpp_codegen_method_is_interface_method(targetMethod))
						GenericInterfaceActionInvoker0::Invoke(targetMethod, ___paths0);
					else
						GenericVirtActionInvoker0::Invoke(targetMethod, ___paths0);
				}
				else
				{
					if (il2cpp_codegen_method_is_interface_method(targetMethod))
						InterfaceActionInvoker0::Invoke(il2cpp_codegen_method_get_slot(targetMethod), il2cpp_codegen_method_get_declaring_type(targetMethod), ___paths0);
					else
						VirtActionInvoker0::Invoke(il2cpp_codegen_method_get_slot(targetMethod), ___paths0);
				}
			}
			else
			{
				typedef void (*FunctionPointerType) (StringU5BU5D_t1281789340*, const RuntimeMethod*);
				((FunctionPointerType)targetMethodPointer)(___paths0, targetMethod);
			}
		}
	}
}
// System.IAsyncResult NativeGallery/MediaPickMultipleCallback::BeginInvoke(System.String[],System.AsyncCallback,System.Object)
extern "C"  RuntimeObject* MediaPickMultipleCallback_BeginInvoke_m1426129778 (MediaPickMultipleCallback_t2483155519 * __this, StringU5BU5D_t1281789340* ___paths0, AsyncCallback_t3962456242 * ___callback1, RuntimeObject * ___object2, const RuntimeMethod* method)
{
	void *__d_args[2] = {0};
	__d_args[0] = ___paths0;
	return (RuntimeObject*)il2cpp_codegen_delegate_begin_invoke((RuntimeDelegate*)__this, __d_args, (RuntimeDelegate*)___callback1, (RuntimeObject*)___object2);
}
// System.Void NativeGallery/MediaPickMultipleCallback::EndInvoke(System.IAsyncResult)
extern "C"  void MediaPickMultipleCallback_EndInvoke_m1817353642 (MediaPickMultipleCallback_t2483155519 * __this, RuntimeObject* ___result0, const RuntimeMethod* method)
{
	il2cpp_codegen_delegate_end_invoke((Il2CppAsyncResult*) ___result0, 0);
}
#ifdef __clang__
#pragma clang diagnostic pop
#endif
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif
extern "C"  void DelegatePInvokeWrapper_MediaSaveCallback_t1711154875 (MediaSaveCallback_t1711154875 * __this, String_t* ___error0, const RuntimeMethod* method)
{
	typedef void (STDCALL *PInvokeFunc)(char*);
	PInvokeFunc il2cppPInvokeFunc = reinterpret_cast<PInvokeFunc>(il2cpp_codegen_get_method_pointer(((RuntimeDelegate*)__this)->method));

	// Marshaling of parameter '___error0' to native representation
	char* ____error0_marshaled = NULL;
	____error0_marshaled = il2cpp_codegen_marshal_string(___error0);

	// Native function invocation
	il2cppPInvokeFunc(____error0_marshaled);

	// Marshaling cleanup of parameter '___error0' native representation
	il2cpp_codegen_marshal_free(____error0_marshaled);
	____error0_marshaled = NULL;

}
// System.Void NativeGallery/MediaSaveCallback::.ctor(System.Object,System.IntPtr)
extern "C"  void MediaSaveCallback__ctor_m796243933 (MediaSaveCallback_t1711154875 * __this, RuntimeObject * ___object0, intptr_t ___method1, const RuntimeMethod* method)
{
	__this->set_method_ptr_0(il2cpp_codegen_get_method_pointer((RuntimeMethod*)___method1));
	__this->set_method_3(___method1);
	__this->set_m_target_2(___object0);
}
// System.Void NativeGallery/MediaSaveCallback::Invoke(System.String)
extern "C"  void MediaSaveCallback_Invoke_m1355652789 (MediaSaveCallback_t1711154875 * __this, String_t* ___error0, const RuntimeMethod* method)
{
	if(__this->get_prev_9() != NULL)
	{
		MediaSaveCallback_Invoke_m1355652789((MediaSaveCallback_t1711154875 *)__this->get_prev_9(), ___error0, method);
	}
	Il2CppMethodPointer targetMethodPointer = __this->get_method_ptr_0();
	RuntimeMethod* targetMethod = (RuntimeMethod*)(__this->get_method_3());
	RuntimeObject* targetThis = __this->get_m_target_2();
	il2cpp_codegen_raise_execution_engine_exception_if_method_is_not_found(targetMethod);
	bool ___methodIsStatic = MethodIsStatic(targetMethod);
	if (___methodIsStatic)
	{
		if (il2cpp_codegen_method_parameter_count(targetMethod) == 1)
		{
			// open
			{
				typedef void (*FunctionPointerType) (RuntimeObject *, String_t*, const RuntimeMethod*);
				((FunctionPointerType)targetMethodPointer)(NULL, ___error0, targetMethod);
			}
		}
		else
		{
			// closed
			{
				typedef void (*FunctionPointerType) (RuntimeObject *, void*, String_t*, const RuntimeMethod*);
				((FunctionPointerType)targetMethodPointer)(NULL, targetThis, ___error0, targetMethod);
			}
		}
	}
	else
	{
		if (il2cpp_codegen_method_parameter_count(targetMethod) == 1)
		{
			// closed
			if (il2cpp_codegen_method_is_virtual(targetMethod) && !il2cpp_codegen_object_is_of_sealed_type(targetThis) && il2cpp_codegen_delegate_has_invoker((Il2CppDelegate*)__this))
			{
				if (il2cpp_codegen_method_is_generic_instance(targetMethod))
				{
					if (il2cpp_codegen_method_is_interface_method(targetMethod))
						GenericInterfaceActionInvoker1< String_t* >::Invoke(targetMethod, targetThis, ___error0);
					else
						GenericVirtActionInvoker1< String_t* >::Invoke(targetMethod, targetThis, ___error0);
				}
				else
				{
					if (il2cpp_codegen_method_is_interface_method(targetMethod))
						InterfaceActionInvoker1< String_t* >::Invoke(il2cpp_codegen_method_get_slot(targetMethod), il2cpp_codegen_method_get_declaring_type(targetMethod), targetThis, ___error0);
					else
						VirtActionInvoker1< String_t* >::Invoke(il2cpp_codegen_method_get_slot(targetMethod), targetThis, ___error0);
				}
			}
			else
			{
				typedef void (*FunctionPointerType) (void*, String_t*, const RuntimeMethod*);
				((FunctionPointerType)targetMethodPointer)(targetThis, ___error0, targetMethod);
			}
		}
		else
		{
			// open
			if (il2cpp_codegen_method_is_virtual(targetMethod) && !il2cpp_codegen_object_is_of_sealed_type(targetThis) && il2cpp_codegen_delegate_has_invoker((Il2CppDelegate*)__this))
			{
				if (il2cpp_codegen_method_is_generic_instance(targetMethod))
				{
					if (il2cpp_codegen_method_is_interface_method(targetMethod))
						GenericInterfaceActionInvoker0::Invoke(targetMethod, ___error0);
					else
						GenericVirtActionInvoker0::Invoke(targetMethod, ___error0);
				}
				else
				{
					if (il2cpp_codegen_method_is_interface_method(targetMethod))
						InterfaceActionInvoker0::Invoke(il2cpp_codegen_method_get_slot(targetMethod), il2cpp_codegen_method_get_declaring_type(targetMethod), ___error0);
					else
						VirtActionInvoker0::Invoke(il2cpp_codegen_method_get_slot(targetMethod), ___error0);
				}
			}
			else
			{
				typedef void (*FunctionPointerType) (String_t*, const RuntimeMethod*);
				((FunctionPointerType)targetMethodPointer)(___error0, targetMethod);
			}
		}
	}
}
// System.IAsyncResult NativeGallery/MediaSaveCallback::BeginInvoke(System.String,System.AsyncCallback,System.Object)
extern "C"  RuntimeObject* MediaSaveCallback_BeginInvoke_m3218738691 (MediaSaveCallback_t1711154875 * __this, String_t* ___error0, AsyncCallback_t3962456242 * ___callback1, RuntimeObject * ___object2, const RuntimeMethod* method)
{
	void *__d_args[2] = {0};
	__d_args[0] = ___error0;
	return (RuntimeObject*)il2cpp_codegen_delegate_begin_invoke((RuntimeDelegate*)__this, __d_args, (RuntimeDelegate*)___callback1, (RuntimeObject*)___object2);
}
// System.Void NativeGallery/MediaSaveCallback::EndInvoke(System.IAsyncResult)
extern "C"  void MediaSaveCallback_EndInvoke_m3783509556 (MediaSaveCallback_t1711154875 * __this, RuntimeObject* ___result0, const RuntimeMethod* method)
{
	il2cpp_codegen_delegate_end_invoke((Il2CppAsyncResult*) ___result0, 0);
}
#ifdef __clang__
#pragma clang diagnostic pop
#endif
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif
#ifdef __clang__
#pragma clang diagnostic pop
#endif
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif
// System.Void NativeGalleryNamespace.NGMediaReceiveCallbackiOS::.ctor()
extern "C"  void NGMediaReceiveCallbackiOS__ctor_m520988739 (NGMediaReceiveCallbackiOS_t840779778 * __this, const RuntimeMethod* method)
{
	{
		MonoBehaviour__ctor_m1579109191(__this, /*hidden argument*/NULL);
		return;
	}
}
// System.Boolean NativeGalleryNamespace.NGMediaReceiveCallbackiOS::get_IsBusy()
extern "C"  bool NGMediaReceiveCallbackiOS_get_IsBusy_m4210058844 (RuntimeObject * __this /* static, unused */, const RuntimeMethod* method)
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_method (NGMediaReceiveCallbackiOS_get_IsBusy_m4210058844_MetadataUsageId);
		s_Il2CppMethodInitialized = true;
	}
	{
		bool L_0 = ((NGMediaReceiveCallbackiOS_t840779778_StaticFields*)il2cpp_codegen_static_fields_for(NGMediaReceiveCallbackiOS_t840779778_il2cpp_TypeInfo_var))->get_U3CIsBusyU3Ek__BackingField_5();
		return L_0;
	}
}
// System.Void NativeGalleryNamespace.NGMediaReceiveCallbackiOS::set_IsBusy(System.Boolean)
extern "C"  void NGMediaReceiveCallbackiOS_set_IsBusy_m2666300196 (RuntimeObject * __this /* static, unused */, bool ___value0, const RuntimeMethod* method)
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_method (NGMediaReceiveCallbackiOS_set_IsBusy_m2666300196_MetadataUsageId);
		s_Il2CppMethodInitialized = true;
	}
	{
		bool L_0 = ___value0;
		((NGMediaReceiveCallbackiOS_t840779778_StaticFields*)il2cpp_codegen_static_fields_for(NGMediaReceiveCallbackiOS_t840779778_il2cpp_TypeInfo_var))->set_U3CIsBusyU3Ek__BackingField_5(L_0);
		return;
	}
}
extern "C" int32_t DEFAULT_CALL _NativeGallery_IsMediaPickerBusy();
// System.Int32 NativeGalleryNamespace.NGMediaReceiveCallbackiOS::_NativeGallery_IsMediaPickerBusy()
extern "C"  int32_t NGMediaReceiveCallbackiOS__NativeGallery_IsMediaPickerBusy_m3591074261 (RuntimeObject * __this /* static, unused */, const RuntimeMethod* method)
{
	typedef int32_t (DEFAULT_CALL *PInvokeFunc) ();

	// Native function invocation
	int32_t returnValue = reinterpret_cast<PInvokeFunc>(_NativeGallery_IsMediaPickerBusy)();

	return returnValue;
}
// System.Void NativeGalleryNamespace.NGMediaReceiveCallbackiOS::Initialize(NativeGallery/MediaPickCallback)
extern "C"  void NGMediaReceiveCallbackiOS_Initialize_m2371316744 (RuntimeObject * __this /* static, unused */, MediaPickCallback_t2468098299 * ___callback0, const RuntimeMethod* method)
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_method (NGMediaReceiveCallbackiOS_Initialize_m2371316744_MetadataUsageId);
		s_Il2CppMethodInitialized = true;
	}
	{
		bool L_0 = NGMediaReceiveCallbackiOS_get_IsBusy_m4210058844(NULL /*static, unused*/, /*hidden argument*/NULL);
		if (!L_0)
		{
			goto IL_000b;
		}
	}
	{
		return;
	}

IL_000b:
	{
		NGMediaReceiveCallbackiOS_t840779778 * L_1 = ((NGMediaReceiveCallbackiOS_t840779778_StaticFields*)il2cpp_codegen_static_fields_for(NGMediaReceiveCallbackiOS_t840779778_il2cpp_TypeInfo_var))->get_instance_2();
		IL2CPP_RUNTIME_CLASS_INIT(Object_t631007953_il2cpp_TypeInfo_var);
		bool L_2 = Object_op_Equality_m1810815630(NULL /*static, unused*/, L_1, (Object_t631007953 *)NULL, /*hidden argument*/NULL);
		if (!L_2)
		{
			goto IL_003e;
		}
	}
	{
		GameObject_t1113636619 * L_3 = (GameObject_t1113636619 *)il2cpp_codegen_object_new(GameObject_t1113636619_il2cpp_TypeInfo_var);
		GameObject__ctor_m2093116449(L_3, _stringLiteral2435805968, /*hidden argument*/NULL);
		NullCheck(L_3);
		NGMediaReceiveCallbackiOS_t840779778 * L_4 = GameObject_AddComponent_TisNGMediaReceiveCallbackiOS_t840779778_m935052088(L_3, /*hidden argument*/GameObject_AddComponent_TisNGMediaReceiveCallbackiOS_t840779778_m935052088_RuntimeMethod_var);
		((NGMediaReceiveCallbackiOS_t840779778_StaticFields*)il2cpp_codegen_static_fields_for(NGMediaReceiveCallbackiOS_t840779778_il2cpp_TypeInfo_var))->set_instance_2(L_4);
		NGMediaReceiveCallbackiOS_t840779778 * L_5 = ((NGMediaReceiveCallbackiOS_t840779778_StaticFields*)il2cpp_codegen_static_fields_for(NGMediaReceiveCallbackiOS_t840779778_il2cpp_TypeInfo_var))->get_instance_2();
		NullCheck(L_5);
		GameObject_t1113636619 * L_6 = Component_get_gameObject_m442555142(L_5, /*hidden argument*/NULL);
		IL2CPP_RUNTIME_CLASS_INIT(Object_t631007953_il2cpp_TypeInfo_var);
		Object_DontDestroyOnLoad_m166252750(NULL /*static, unused*/, L_6, /*hidden argument*/NULL);
	}

IL_003e:
	{
		NGMediaReceiveCallbackiOS_t840779778 * L_7 = ((NGMediaReceiveCallbackiOS_t840779778_StaticFields*)il2cpp_codegen_static_fields_for(NGMediaReceiveCallbackiOS_t840779778_il2cpp_TypeInfo_var))->get_instance_2();
		MediaPickCallback_t2468098299 * L_8 = ___callback0;
		NullCheck(L_7);
		L_7->set_callback_3(L_8);
		NGMediaReceiveCallbackiOS_t840779778 * L_9 = ((NGMediaReceiveCallbackiOS_t840779778_StaticFields*)il2cpp_codegen_static_fields_for(NGMediaReceiveCallbackiOS_t840779778_il2cpp_TypeInfo_var))->get_instance_2();
		float L_10 = Time_get_realtimeSinceStartup_m3141794964(NULL /*static, unused*/, /*hidden argument*/NULL);
		NullCheck(L_9);
		L_9->set_nextBusyCheckTime_4(((float)il2cpp_codegen_add((float)L_10, (float)(1.0f))));
		NGMediaReceiveCallbackiOS_set_IsBusy_m2666300196(NULL /*static, unused*/, (bool)1, /*hidden argument*/NULL);
		return;
	}
}
// System.Void NativeGalleryNamespace.NGMediaReceiveCallbackiOS::Update()
extern "C"  void NGMediaReceiveCallbackiOS_Update_m1199023163 (NGMediaReceiveCallbackiOS_t840779778 * __this, const RuntimeMethod* method)
{
	{
		bool L_0 = NGMediaReceiveCallbackiOS_get_IsBusy_m4210058844(NULL /*static, unused*/, /*hidden argument*/NULL);
		if (!L_0)
		{
			goto IL_0059;
		}
	}
	{
		float L_1 = Time_get_realtimeSinceStartup_m3141794964(NULL /*static, unused*/, /*hidden argument*/NULL);
		float L_2 = __this->get_nextBusyCheckTime_4();
		if ((!(((float)L_1) >= ((float)L_2))))
		{
			goto IL_0059;
		}
	}
	{
		float L_3 = Time_get_realtimeSinceStartup_m3141794964(NULL /*static, unused*/, /*hidden argument*/NULL);
		__this->set_nextBusyCheckTime_4(((float)il2cpp_codegen_add((float)L_3, (float)(1.0f))));
		int32_t L_4 = NGMediaReceiveCallbackiOS__NativeGallery_IsMediaPickerBusy_m3591074261(NULL /*static, unused*/, /*hidden argument*/NULL);
		if (L_4)
		{
			goto IL_0059;
		}
	}
	{
		MediaPickCallback_t2468098299 * L_5 = __this->get_callback_3();
		if (!L_5)
		{
			goto IL_0053;
		}
	}
	{
		MediaPickCallback_t2468098299 * L_6 = __this->get_callback_3();
		NullCheck(L_6);
		MediaPickCallback_Invoke_m771420990(L_6, (String_t*)NULL, /*hidden argument*/NULL);
		__this->set_callback_3((MediaPickCallback_t2468098299 *)NULL);
	}

IL_0053:
	{
		NGMediaReceiveCallbackiOS_set_IsBusy_m2666300196(NULL /*static, unused*/, (bool)0, /*hidden argument*/NULL);
	}

IL_0059:
	{
		return;
	}
}
// System.Void NativeGalleryNamespace.NGMediaReceiveCallbackiOS::OnMediaReceived(System.String)
extern "C"  void NGMediaReceiveCallbackiOS_OnMediaReceived_m4220214762 (NGMediaReceiveCallbackiOS_t840779778 * __this, String_t* ___path0, const RuntimeMethod* method)
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_method (NGMediaReceiveCallbackiOS_OnMediaReceived_m4220214762_MetadataUsageId);
		s_Il2CppMethodInitialized = true;
	}
	{
		String_t* L_0 = ___path0;
		IL2CPP_RUNTIME_CLASS_INIT(String_t_il2cpp_TypeInfo_var);
		bool L_1 = String_IsNullOrEmpty_m2969720369(NULL /*static, unused*/, L_0, /*hidden argument*/NULL);
		if (!L_1)
		{
			goto IL_000e;
		}
	}
	{
		___path0 = (String_t*)NULL;
	}

IL_000e:
	{
		MediaPickCallback_t2468098299 * L_2 = __this->get_callback_3();
		if (!L_2)
		{
			goto IL_002c;
		}
	}
	{
		MediaPickCallback_t2468098299 * L_3 = __this->get_callback_3();
		String_t* L_4 = ___path0;
		NullCheck(L_3);
		MediaPickCallback_Invoke_m771420990(L_3, L_4, /*hidden argument*/NULL);
		__this->set_callback_3((MediaPickCallback_t2468098299 *)NULL);
	}

IL_002c:
	{
		NGMediaReceiveCallbackiOS_set_IsBusy_m2666300196(NULL /*static, unused*/, (bool)0, /*hidden argument*/NULL);
		return;
	}
}
#ifdef __clang__
#pragma clang diagnostic pop
#endif
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif
// System.Void NativeGalleryNamespace.NGMediaSaveCallbackiOS::.ctor()
extern "C"  void NGMediaSaveCallbackiOS__ctor_m676139182 (NGMediaSaveCallbackiOS_t2373647639 * __this, const RuntimeMethod* method)
{
	{
		MonoBehaviour__ctor_m1579109191(__this, /*hidden argument*/NULL);
		return;
	}
}
// System.Void NativeGalleryNamespace.NGMediaSaveCallbackiOS::Initialize(NativeGallery/MediaSaveCallback)
extern "C"  void NGMediaSaveCallbackiOS_Initialize_m3647472094 (RuntimeObject * __this /* static, unused */, MediaSaveCallback_t1711154875 * ___callback0, const RuntimeMethod* method)
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_method (NGMediaSaveCallbackiOS_Initialize_m3647472094_MetadataUsageId);
		s_Il2CppMethodInitialized = true;
	}
	{
		NGMediaSaveCallbackiOS_t2373647639 * L_0 = ((NGMediaSaveCallbackiOS_t2373647639_StaticFields*)il2cpp_codegen_static_fields_for(NGMediaSaveCallbackiOS_t2373647639_il2cpp_TypeInfo_var))->get_instance_2();
		IL2CPP_RUNTIME_CLASS_INIT(Object_t631007953_il2cpp_TypeInfo_var);
		bool L_1 = Object_op_Equality_m1810815630(NULL /*static, unused*/, L_0, (Object_t631007953 *)NULL, /*hidden argument*/NULL);
		if (!L_1)
		{
			goto IL_0038;
		}
	}
	{
		GameObject_t1113636619 * L_2 = (GameObject_t1113636619 *)il2cpp_codegen_object_new(GameObject_t1113636619_il2cpp_TypeInfo_var);
		GameObject__ctor_m2093116449(L_2, _stringLiteral403054727, /*hidden argument*/NULL);
		NullCheck(L_2);
		NGMediaSaveCallbackiOS_t2373647639 * L_3 = GameObject_AddComponent_TisNGMediaSaveCallbackiOS_t2373647639_m1416436511(L_2, /*hidden argument*/GameObject_AddComponent_TisNGMediaSaveCallbackiOS_t2373647639_m1416436511_RuntimeMethod_var);
		((NGMediaSaveCallbackiOS_t2373647639_StaticFields*)il2cpp_codegen_static_fields_for(NGMediaSaveCallbackiOS_t2373647639_il2cpp_TypeInfo_var))->set_instance_2(L_3);
		NGMediaSaveCallbackiOS_t2373647639 * L_4 = ((NGMediaSaveCallbackiOS_t2373647639_StaticFields*)il2cpp_codegen_static_fields_for(NGMediaSaveCallbackiOS_t2373647639_il2cpp_TypeInfo_var))->get_instance_2();
		NullCheck(L_4);
		GameObject_t1113636619 * L_5 = Component_get_gameObject_m442555142(L_4, /*hidden argument*/NULL);
		IL2CPP_RUNTIME_CLASS_INIT(Object_t631007953_il2cpp_TypeInfo_var);
		Object_DontDestroyOnLoad_m166252750(NULL /*static, unused*/, L_5, /*hidden argument*/NULL);
		goto IL_0057;
	}

IL_0038:
	{
		NGMediaSaveCallbackiOS_t2373647639 * L_6 = ((NGMediaSaveCallbackiOS_t2373647639_StaticFields*)il2cpp_codegen_static_fields_for(NGMediaSaveCallbackiOS_t2373647639_il2cpp_TypeInfo_var))->get_instance_2();
		NullCheck(L_6);
		MediaSaveCallback_t1711154875 * L_7 = L_6->get_callback_3();
		if (!L_7)
		{
			goto IL_0057;
		}
	}
	{
		NGMediaSaveCallbackiOS_t2373647639 * L_8 = ((NGMediaSaveCallbackiOS_t2373647639_StaticFields*)il2cpp_codegen_static_fields_for(NGMediaSaveCallbackiOS_t2373647639_il2cpp_TypeInfo_var))->get_instance_2();
		NullCheck(L_8);
		MediaSaveCallback_t1711154875 * L_9 = L_8->get_callback_3();
		NullCheck(L_9);
		MediaSaveCallback_Invoke_m1355652789(L_9, (String_t*)NULL, /*hidden argument*/NULL);
	}

IL_0057:
	{
		NGMediaSaveCallbackiOS_t2373647639 * L_10 = ((NGMediaSaveCallbackiOS_t2373647639_StaticFields*)il2cpp_codegen_static_fields_for(NGMediaSaveCallbackiOS_t2373647639_il2cpp_TypeInfo_var))->get_instance_2();
		MediaSaveCallback_t1711154875 * L_11 = ___callback0;
		NullCheck(L_10);
		L_10->set_callback_3(L_11);
		return;
	}
}
// System.Void NativeGalleryNamespace.NGMediaSaveCallbackiOS::OnMediaSaveCompleted(System.String)
extern "C"  void NGMediaSaveCallbackiOS_OnMediaSaveCompleted_m2237196217 (NGMediaSaveCallbackiOS_t2373647639 * __this, String_t* ___message0, const RuntimeMethod* method)
{
	{
		MediaSaveCallback_t1711154875 * L_0 = __this->get_callback_3();
		if (!L_0)
		{
			goto IL_001e;
		}
	}
	{
		MediaSaveCallback_t1711154875 * L_1 = __this->get_callback_3();
		NullCheck(L_1);
		MediaSaveCallback_Invoke_m1355652789(L_1, (String_t*)NULL, /*hidden argument*/NULL);
		__this->set_callback_3((MediaSaveCallback_t1711154875 *)NULL);
	}

IL_001e:
	{
		return;
	}
}
// System.Void NativeGalleryNamespace.NGMediaSaveCallbackiOS::OnMediaSaveFailed(System.String)
extern "C"  void NGMediaSaveCallbackiOS_OnMediaSaveFailed_m3052083401 (NGMediaSaveCallbackiOS_t2373647639 * __this, String_t* ___error0, const RuntimeMethod* method)
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_method (NGMediaSaveCallbackiOS_OnMediaSaveFailed_m3052083401_MetadataUsageId);
		s_Il2CppMethodInitialized = true;
	}
	{
		String_t* L_0 = ___error0;
		IL2CPP_RUNTIME_CLASS_INIT(String_t_il2cpp_TypeInfo_var);
		bool L_1 = String_IsNullOrEmpty_m2969720369(NULL /*static, unused*/, L_0, /*hidden argument*/NULL);
		if (!L_1)
		{
			goto IL_0012;
		}
	}
	{
		___error0 = _stringLiteral1471173669;
	}

IL_0012:
	{
		MediaSaveCallback_t1711154875 * L_2 = __this->get_callback_3();
		if (!L_2)
		{
			goto IL_0030;
		}
	}
	{
		MediaSaveCallback_t1711154875 * L_3 = __this->get_callback_3();
		String_t* L_4 = ___error0;
		NullCheck(L_3);
		MediaSaveCallback_Invoke_m1355652789(L_3, L_4, /*hidden argument*/NULL);
		__this->set_callback_3((MediaSaveCallback_t1711154875 *)NULL);
	}

IL_0030:
	{
		return;
	}
}
#ifdef __clang__
#pragma clang diagnostic pop
#endif
