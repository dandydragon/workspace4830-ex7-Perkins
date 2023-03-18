
/*
 * @(#) MyAspect.aj
 *
 */

public aspect TraceAspectPerkins {
   pointcut classToTrace(): within(ComponentApp) || within(DataApp) || within(ServiceApp);

   //pointcut constructorToTrace(): classToTrace() && execution(new(..));

   pointcut methodToTrace():  classToTrace() &&  execution(String getName());
   
   /*before(): constructorToTrace() {
      System.out.println("\t-->" + thisJoinPointStaticPart.getSignature() + //
            ", " + thisJoinPointStaticPart.getSourceLocation().getLine());
      Object[] paramValues = thisJoinPoint.getArgs();
      if (paramValues != null) {
         for (Object iParam : paramValues) {
            System.out.println("\t\tPARAM: not needed" + iParam);
         }
      }
   }

   after(): constructorToTrace() {
      System.out.println("\t<--" + thisJoinPointStaticPart.getSignature());
   }*/

   before(): methodToTrace() {
      System.out.println("[BGN] " + thisJoinPointStaticPart.getSignature() + ", " + //
            thisJoinPointStaticPart.getSourceLocation().getLine());
   }

   after(): methodToTrace() {
      System.out.println("[END] " + thisJoinPointStaticPart.getSourceLocation().getFileName());
   }
}
