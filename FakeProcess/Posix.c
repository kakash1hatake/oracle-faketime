#include <stdlib.h>
#include "Posix.h"

JNIEXPORT jint JNICALL Java_Posix_setenv(JNIEnv *env, jclass cls, jstring key, jstring value, jboolean overwrite)
{
    char* k = (char *) (*env)->GetStringUTFChars(env, key, NULL);
    char* v = (char *) (*env)->GetStringUTFChars(env, value, NULL);

    int err = setenv(k, v, overwrite);

    (*env)->ReleaseStringUTFChars(env, key, k);
    (*env)->ReleaseStringUTFChars(env, value, v);

    return err;
}

JNIEXPORT jstring JNICALL Java_Posix_getenv(JNIEnv *env, jclass cls, jstring key)
{
    char* k = (char *) (*env)->GetStringUTFChars(env, key, NULL);
    char* v = getenv(k);

    return (*env)->NewStringUTF(env, v);
}