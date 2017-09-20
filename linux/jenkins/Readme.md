# Image Description
Base Jenkins image (https://docs.docker.com/samples/library/jenkins) with additional tools required for my purposes. It includes

   .Net Core 2.0.0 (https://www.microsoft.com/net/download/linux)

# Issues
Workaround implemented: Currently libcurl3 has to be downgraded so that we don't run into segmentation fault when using dotnet run/build/...
https://github.com/dotnet/core/issues/963